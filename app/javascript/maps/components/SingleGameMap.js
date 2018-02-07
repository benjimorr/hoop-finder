import React, { Component } from 'react';
import {
  withScriptjs,
  withGoogleMap,
  GoogleMap,
  Marker
} from "react-google-maps";
const { InfoBox } = require("react-google-maps/lib/components/addons/InfoBox");

const CourtMap = withScriptjs(withGoogleMap((props) =>
    <GoogleMap
        defaultZoom={14}
        defaultCenter={{ lat: props.latitude, lng: props.longitude }}
    >
        <Marker position={{ lat: props.latitude, lng: props.longitude }}>
            <InfoBox
                options={{ closeBoxURL: ``, enableEventPropagation: true }}
            >
                <div style={{ backgroundColor: `black`, opacity: 0.75, padding: `12px` }}>
                    <div style={{ fontColor: `#ffffff` }}>
                        {props.name}
                    </div>
                </div>
            </InfoBox>
        </Marker>
    </GoogleMap>
));

const SingleGameMap = (props) => (
    <CourtMap
        isMarkerShown
        latitude={props.court.latitude}
        longitude={props.court.longitude}
        name={props.court.name}
        googleMapURL={`https://maps.googleapis.com/maps/api/js?key=${props.apiKey}&v=3.exp&libraries=geometry,drawing,places`}
        loadingElement={<div style={{ height: `100%` }} />}
        containerElement={<div style={{ height: `400px` }} />}
        mapElement={<div style={{ height: `100%` }} />}
    />
)

export default SingleGameMap;
