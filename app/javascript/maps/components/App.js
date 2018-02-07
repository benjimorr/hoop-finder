import React from 'react';
import SingleGameMap from './SingleGameMap';
import AllGamesMap from './AllGamesMap';

const App = (props) => {
    if(props.locations) {
        return <AllGamesMap apiKey={props.apiKey} locations={props.locations} />;
    } else if(props.court) {
        return <SingleGameMap apiKey={props.apiKey} court={props.court} />;
    }
}

export default App;
