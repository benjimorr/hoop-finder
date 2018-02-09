import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';

const allGamesNode = document.getElementById('all-games-map');
const singleGameNode = document.getElementById('single-game-map');

if(allGamesNode) {
    const data = JSON.parse(allGamesNode.getAttribute('data-locations'));
    const apiKey = allGamesNode.getAttribute('data-api-key');
    ReactDOM.render(<App locations={data.courts} apiKey={apiKey}  />, allGamesNode);
} else if(singleGameNode) {
    const data = JSON.parse(singleGameNode.getAttribute('data-court'));
    const apiKey = singleGameNode.getAttribute('data-api-key');
    ReactDOM.render(<App court={data.court} apiKey={apiKey}  />, singleGameNode);
}
