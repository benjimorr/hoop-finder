import React from 'react';
import {
    BrowserRouter as Router,
    Route
} from 'react-router-dom';
import AllGamesMap from './AllGamesMap';

const App = (props) => (
    <Router>
      <div>
        <Route
          path='/games'
          render={ () => <AllGamesMap apiKey={props.apiKey} locations={props.courts} isMarkerShown /> }
        />
      </div>
    </Router>
)

export default App;
