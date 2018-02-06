import React from 'react';
import {
  withScriptjs,
  withGoogleMap,
  GoogleMap,
  Marker
} from "react-google-maps";

const renderMarker = (id, lat, lng) => {
    return <Marker key={id} position={{ lat, lng }} />;
}

const MapMaker = withScriptjs(withGoogleMap((props) =>
    <GoogleMap
        defaultZoom={12}
        defaultCenter={{ lat: props.latitude, lng: props.longitude }}
    >
        {props.isMarkerShown && props.locations.map(loc => renderMarker(loc.id, loc.latitude, loc.longitude))}
    </GoogleMap>
));

export default MapMaker;
