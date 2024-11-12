import React from 'react';
import { Link } from 'react-router-dom';
import '../NavBar.css';

const Navbar = ({ isAuthenticated }) => {
    return (
        <nav className="navbar">
            <ul className="nav-list">
                <li>
                    <Link to="/">Home</Link>
                </li>
                {isAuthenticated && (
                    <li>
                        <Link to="/dashboard">Dashboard</Link>
                    </li>
                )}
                {!isAuthenticated ? (
                    <>
                        <li>
                            <Link to="/login">Login</Link>
                        </li>
                        <li>
                            <Link to="/signup">Signup</Link>
                        </li>
                    </>
                ) : null}
            </ul>
        </nav>
    );
};

export default Navbar;











