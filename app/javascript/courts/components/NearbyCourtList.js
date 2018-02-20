import React, { Component } from 'react';
import { connect } from "react-redux";
import { bindActionCreators } from "redux";
import { findNearbyCourts } from '../actions/index';
import NearbyCourt from './NearbyCourt';

class NearbyCourtList extends Component {
    constructor(props) {
        super(props);

        this.renderCourt = this.renderCourt.bind(this);
    }

    componentWillReceiveProps(nextProps) {
        if(nextProps.geocodedAddress.length > 0 && nextProps.geocodedAddress !== this.props.geocodedAddress) {
            this.props.findNearbyCourts(nextProps.geocodedAddress[0], nextProps.geocodedAddress[1]);
        }
    }

    renderCourt(court) {
        if(court.formatted_address.split(', ').length > 3) {
            return (
                <NearbyCourt key={court.place_id} court={court} />
            );
        }
    }

    render() {
        if(this.props.nearbyCourts.length > 0) {
            return (
                <div className="court-list">
                    <ul className="list-group">
                        {this.props.nearbyCourts.map(court => this.renderCourt(court))}
                    </ul>
                </div>
            );
        } else if(this.props.geocodedAddress.length == 0) {
            return (
                <div className="court-list">
                    <h2 className="court-list-title">Please fill in a valid address to view nearby courts.</h2>
                </div>
            );
        } else if(this.props.geocodedAddress.length > 0) {
            return (
                <div className="court-list">
                    <h2 className="court-list-title">Loading courts...</h2>
                </div>
            );
        }
    }
};

function mapStateToProps({ geocodedAddress, nearbyCourts }) {
    return { geocodedAddress, nearbyCourts };
}

function mapDispatchToProps(dispatch) {
    return bindActionCreators({ findNearbyCourts }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(NearbyCourtList);
