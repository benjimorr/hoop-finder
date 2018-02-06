import React from 'react';
import {
  withScriptjs,
  withGoogleMap,
  GoogleMap,
  Marker
} from "react-google-maps";
const { InfoBox } = require("react-google-maps/lib/components/addons/InfoBox");

const renderMarker = (id, name, lat, lng) => {
    return <Marker
                key={id}
                position={{ lat, lng }}
            >
                <InfoBox
                    options={{ closeBoxURL: ``, enableEventPropagation: true }}
                >
                    <div style={{ backgroundColor: `black`, opacity: 0.75, padding: `12px` }}>
                        <div style={{ fontColor: `#ffffff` }}>
                            {name}
                        </div>
                    </div>
                </InfoBox>
            </Marker>;
}

const MapMaker = withScriptjs(withGoogleMap((props) =>
    <GoogleMap
        defaultZoom={12}
        defaultCenter={{ lat: props.latitude, lng: props.longitude }}
    >
        {props.isMarkerShown && props.locations.map(loc => renderMarker(loc.id, loc.name, loc.latitude, loc.longitude))}
    </GoogleMap>
));

export default MapMaker;
