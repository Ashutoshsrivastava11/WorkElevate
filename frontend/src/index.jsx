import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import './styles/styles.css'; // Import the CSS file from the styles directory

// Render the App component into the root element of the HTML
ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById('root')
);
