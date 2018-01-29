import React from 'react';
import {
    BrowserRouter as Router,
    Route
} from 'react-router-dom';
import GameList from './GameList';

const App = (props) => (
    <Router>
      <div>
        <Route
          path='/games'
          render={ () => <GameList games={props.games} /> }
        />
      </div>
    </Router>
)

export default App;
