import React, { useState } from 'react';
import axios from 'axios';
import '../Signup.css'; // Import the CSS file

const Signup = () => {
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const [email, setEmail] = useState('');
    const [errorMessage, setErrorMessage] = useState(''); // To store error messages
    const [successMessage, setSuccessMessage] = useState(''); // To store success message

    // Password validation: checks if it's >= 5 characters and contains at least one special character
    const validatePassword = (password) => {
        const passwordLengthValid = password.length >= 5;
        const specialCharacterValid = /[!@#$%^&*(),.?":{}|<>]/.test(password); // Checks for special characters
        return passwordLengthValid && specialCharacterValid;
    };

    const handleSignup = async (e) => {
        e.preventDefault();
        setErrorMessage(''); // Reset error message on form submission
        setSuccessMessage(''); // Reset success message

        // Validate password criteria
        if (!validatePassword(password)) {
            setErrorMessage('Password must be at least 5 characters long and include at least one special character.');
            return;
        }

        try {
            // Send signup data to the backend
            await axios.post('http://localhost:5000/api/signup', { username, password, email });
            setSuccessMessage('User registered successfully! You can now log in.'); // Show success message
        } catch (error) {
            if (error.response && error.response.data) {
                setErrorMessage(error.response.data); // Display error from backend
            } else {
                setErrorMessage('An error occurred. Please try again.'); // Generic error message
            }
        }
    };

    return (
        <div className="signup-container">
            <form onSubmit={handleSignup} className="signup-form">
                <h2>Sign Up</h2>

                {/* Display success message inside the form */}
                {successMessage && (
                    <div className="success-box">
                        {successMessage}
                    </div>
                )}

                {/* Display error message inside the form */}
                {errorMessage && (
                    <div className="error-box">
                        {errorMessage}
                    </div>
                )}

                <input 
                    type="text" 
                    placeholder="Username" 
                    onChange={e => setUsername(e.target.value)} 
                    required 
                    className="signup-input" 
                />
                <input 
                    type="password" 
                    placeholder="Password" 
                    onChange={e => setPassword(e.target.value)} 
                    required 
                    className="signup-input" 
                />
                <input 
                    type="email" 
                    placeholder="Email" 
                    onChange={e => setEmail(e.target.value)} 
                    required 
                    className="signup-input" 
                />
                <button type="submit" className="signup-button">Sign Up</button>
            </form>
        </div>
    );
};

export default Signup;






