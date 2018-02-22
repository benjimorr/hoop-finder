import React, { Component } from 'react';
import MapMaker from './MapMaker';

export default class AllGamesMap extends Component {
    constructor(props) {
        super(props)

        const DEFAULT_LAT = 40.764989;
        const DEFAULT_LONG = -73.972078;

        this.state = {
            currentLocation: {
                latitude: DEFAULT_LAT,
                longitude: DEFAULT_LONG
            }
        }
    }

    componentDidMount() {
        if (navigator && navigator.geolocation) {
            navigator.geolocation.getCurrentPosition((pos) => {
                const coords = pos.coords;
                this.setState({
                    currentLocation: {
                        latitude: coords.latitude,
                        longitude: coords.longitude
                    }
                })
            })
        }
    }

    render() {
        return (
            <MapMaker
                isMarkerShown
                latitude={this.state.currentLocation.latitude}
                longitude={this.state.currentLocation.longitude}
                locations={this.props.locations}
                googleMapURL={`https://maps.googleapis.com/maps/api/js?key=${this.props.apiKey}&v=3.exp&libraries=geometry,drawing,places`}
                loadingElement={<div style={{ height: `100%` }} />}
                containerElement={<div style={{ height: `400px` }} />}
                mapElement={<div style={{ height: `100%` }} />}
            />
        )
    }
}
