import React from 'react';
import AllGamesMap from './AllGamesMap';

const App = (props) => (
    <AllGamesMap
        apiKey={props.apiKey}
        locations={props.locations}
    />
)

export default App;
