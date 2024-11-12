import React, { useState } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';
import '../Login.css';

const Login = ({ onLogin }) => {
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState(''); // Add error state to capture backend errors
    const navigate = useNavigate();

    const handleLogin = async (e) => {
        e.preventDefault();
        setLoading(true);
        setError(''); // Clear previous error message

        try {
            const response = await axios.post('http://localhost:5000/api/login', { username, password });

            // Check if login is successful
            if (response.data.auth) {
                localStorage.setItem('token', response.data.token);
                localStorage.setItem('username', username);
                localStorage.setItem('userId', response.data.userId);
                onLogin(); // Update authentication state
                navigate('/dashboard'); // Redirect to Dashboard
            } else {
                setError('Invalid login credentials');
            }
        } catch (error) {
            console.error('Login error:', error);

            // Display specific error message from the backend
            if (error.response && error.response.data) {
                setError(error.response.data);  // Set error message from backend response
            } else {
                setError('An error occurred while logging in. Please try again.');
            }
        } finally {
            setLoading(false); // Stop loading
        }
    };

    return (
        <div className="login-container">
            <form className="login-form" onSubmit={handleLogin}>
                <h2>Login</h2>
                {error && <div className="error-message">{error}</div>} {/* Display error message */}
                <input
                    type="text"
                    placeholder="Username"
                    onChange={e => setUsername(e.target.value)}
                    required
                    className="login-input"
                />
                <input
                    type="password"
                    placeholder="Password"
                    onChange={e => setPassword(e.target.value)}
                    required
                    className="login-input"
                />
                <button type="submit" className="login-button" disabled={loading}>
                    {loading ? 'Logging in...' : 'Log In'}
                </button>
            </form>
        </div>
    );
};

export default Login;









