import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';

const node = document.getElementById('google-map');
const data = JSON.parse(node.getAttribute('data-locations'));
const apiKey = node.getAttribute('data-api-key');

ReactDOM.render(<App locations={data.courts} apiKey={apiKey}  />, node);
