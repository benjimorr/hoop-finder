import React, { Component } from 'react';
import {
  withScriptjs,
  withGoogleMap,
  GoogleMap,
  Marker
} from "react-google-maps";
const { InfoBox } = require("react-google-maps/lib/components/addons/InfoBox");

const MapMaker = withScriptjs(withGoogleMap((props) =>
    <GoogleMap
        defaultZoom={12}
        defaultCenter={{ lat: props.latitude, lng: props.longitude }}
    >
    </GoogleMap>
));

const SingleGameMap = (props) => {
    return <MapMaker
            isMarkerShown
            latitude={props.location.latitude}
            longitude={props.location.longitude}
            locations={props.location}
            googleMapURL={`https://maps.googleapis.com/maps/api/js?key=${props.apiKey}&v=3.exp&libraries=geometry,drawing,places`}
            loadingElement={<div style={{ height: `100%` }} />}
            containerElement={<div style={{ height: `400px` }} />}
            mapElement={<div style={{ height: `100%` }} />}
        />
}

export default SingleGameMap;
