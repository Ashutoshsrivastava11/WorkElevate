import React from 'react';
import { Link } from 'react-router-dom';

const JobList = () => {
    return (
        <div className="job-list">
            <h2>Available Jobs</h2>
            <div className="job-item">
                <h3>Frontend Developer</h3>
                <Link to="/jobs/1">
                    <button>View Details</button>
                </Link>
            </div>
            <div className="job-item">
                <h3>Backend Developer</h3>
                <Link to="/jobs/2">
                    <button>View Details</button>
                </Link>
            </div>
            {/* Add more job items as needed */}
        </div>
    );
};

export default JobList;
