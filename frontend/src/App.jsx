import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import JobList from './components/JobList';
import JobDetail from './components/JobDetail';
import UserProfile from './components/UserProfile';
import './styles/styles.css'; // Import the CSS file from the styles directory

const App = () => {
    return (
        <Router>
            <div className="container">
                <header>
                    <h1>Advanced Job Board Platform</h1>
                </header>
                <main>
                    <Routes>
                        <Route path="/" element={<JobList />} />
                        <Route path="/job/:id" element={<JobDetail />} />
                        <Route path="/profile" element={<UserProfile />} />
                    </Routes>
                </main>
                <footer>
                    <p>&copy; 2024 Advanced Job Board Platform. All rights reserved.</p>
                </footer>
            </div>
        </Router>
    );
};

export default App;
