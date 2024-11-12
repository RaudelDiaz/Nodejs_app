import React, { useState } from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Login from './components/Login';
import Signup from './components/Signup';
import Dashboard from './components/Dashboard';
import Navbar from './components/NavBar';
import './App.css'; // Import the CSS file


// Correct import statements for your images
import actionImage from './images/action-image.jpg';
import dramaImage from './images/Murder.png'; 
import comedyImage from './images/Spy.png';
import horrorImage from './images/nun.png'; 
import actionImage2 from './images/Equalizer2.png';
import dramaImage2 from './images/Titanic.png'; 
import horrorImage2 from './images/freddy.png';

const App = () => {
    const [isAuthenticated, setIsAuthenticated] = useState(!!localStorage.getItem('token'));

    const handleLogin = () => {
        setIsAuthenticated(true);
    };

    const handleLogout = () => {
        setIsAuthenticated(false);
        localStorage.removeItem('token');
        localStorage.removeItem('username');
    };

    return (
        <Router>
            <Navbar isAuthenticated={isAuthenticated} />
            <Routes>
                <Route path="/" element={
                    <div className="introduction">
                        <h1>Welcome to CineQuest!</h1>
                        <h2>Your Ultimate Movie Forum</h2>
                        <p>
                            At CineQuest, we believe that every movie has a story worth sharing, and every movie lover deserves a space to express their thoughts. Whether you're a casual viewer or a dedicated cinephile, our platform is crafted just for you!
                        </p>
                        <h3>Explore Film Genres</h3>
                        <p>
                            Dive into our extensive library of genres, from the thrilling excitement of <strong>Action</strong> films to the emotional depth of <strong>Drama</strong>, the laughter found in <strong>Comedy</strong>, and the spine-chilling moments of <strong>Horror</strong>. Discover films that resonate with your mood and interests.
                        </p>
                        <h3>Engage with Fellow Movie Lovers</h3>
                        <p>
                            Have a burning question about a film’s ending? Want to discuss the latest blockbuster? Our forum allows you to ask questions and share answers with a vibrant community of movie enthusiasts. Connect, debate, and expand your cinematic knowledge!
                        </p>
                        <h3>Join Us Today!</h3>
                        <p>
                            Sign up now to unlock all the features CineQuest has to offer. Once you're a member, you can share your thoughts, ask questions, and explore a world of cinematic wonders.
                        </p>
                        <h3>Get Ready for Your Next Movie Adventure!</h3>
                        <p>
                            Start your journey with us and let CineQuest be your guide through the captivating world of cinema.
                        </p>

                        {/* Genre Images Section */}
                        <div className="genre-images">
                            <img src={actionImage} alt="Action Genre" />
                            <img src={dramaImage} alt="Drama Genre" />
                            <img src={comedyImage} alt="Comedy Genre" />
                            <img src={horrorImage} alt="Horror Genre" />
                            <img src={actionImage2} alt="Action Genre" />
                            <img src={dramaImage2} alt="Drama Genre" />
                            <img src={horrorImage2} alt="Horror Genre" />
                        </div>
                    </div>
                } />
                <Route path="/login" element={<Login onLogin={handleLogin} />} />
                <Route path="/signup" element={<Signup />} />
                <Route path="/dashboard" element={<Dashboard onLogout={handleLogout} />} />
            </Routes>
        </Router>
    );
};

export default App;













