import React from 'react';
import CreateCourtForm from './CreateCourtForm';
import NearbyCourtList from './NearbyCourtList';

const App = (props) => (
    <div>
        <div className="row">
            <div className="col-sm-12">
                <CreateCourtForm apiKey={props.apiKey} />
            </div>
        </div>
        <div className="row">
            <div className="col-sm-12">
                <NearbyCourtList authToken={props.authToken} />
            </div>
        </div>
    </div>
)

export default App;
