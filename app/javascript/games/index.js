import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';

const node = document.getElementById('games');
const data = JSON.parse(node.getAttribute('data-games'));

ReactDOM.render(<App games={data.games}  />, node);
