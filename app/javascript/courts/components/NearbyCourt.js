import React, { Component } from 'react';

export default class NearbyCourt extends Component {
    constructor(props) {
        super(props);
    }

    render() {
        const placeId = this.props.court.place_id;
        const name = this.props.court.name;
        const address = this.props.court.formatted_address;

        return (
            <li className="list-group-item">
                <div className="row">
                    <div className="col-sm-6">
                        <h4>{name}</h4>
                        <b>{address}</b>
                    </div>
                    <div className="col-sm-6 select-court-btn">
                        <button className="btn btn-success">Select Court</button>
                    </div>
                </div>
            </li>
        );
    }
};
