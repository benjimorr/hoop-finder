import React from 'react';
import {
    BrowserRouter as Router,
    Route
} from 'react-router-dom';
import SingleGameMap from './SingleGameMap';
import AllGamesMap from './AllGamesMap';

const App = (props) => (
    <Router>
        <div>
            <Route
                path="/games/:gameId"
                render={ () => <SingleGameMap apiKey={props.apiKey} location={props.locations} /> }
            />
            <Route
                path='/games'
                render={ () => <AllGamesMap apiKey={props.apiKey} locations={props.locations} /> }
            />
        </div>
    </Router>
)

export default App;
