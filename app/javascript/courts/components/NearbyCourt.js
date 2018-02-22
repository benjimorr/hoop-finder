import React, { Component } from 'react';

export default class NearbyCourt extends Component {
    constructor(props) {
        super(props);
    }

    render() {
        const placeId = this.props.court.place_id;
        const name = this.props.court.name;
        const address = this.props.court.formatted_address;
        const latitude = this.props.court.geometry.location.lat();
        const longitude = this.props.court.geometry.location.lng();

        return (
            <li className="list-group-item">
                <div className="row">
                    <div className="col-sm-6">
                        <h4>{name}</h4>
                        <b>{address}</b>
                    </div>
                    <div className="col-sm-6 select-court-btn">
                        <form method='post' action='/courts' className='select-court-form'>
                            <input type="hidden" name="google_places_id" value={"" + placeId + ""} />
                            <input type="hidden" name="name" value={"" + name + ""} />
                            <input type="hidden" name="address" value={"" + address + ""} />
                            <input type="hidden" name="latitude" value={"" + latitude + ""} />
                            <input type="hidden" name="longitude" value={"" + longitude + ""} />
                            <input type="hidden" name="authenticity_token" value={"" + this.props.authToken + ""} />
                            <button type="submit" className="btn btn-success">Select Court</button>
                        </form>
                    </div>
                </div>
            </li>
        );
    }
};
