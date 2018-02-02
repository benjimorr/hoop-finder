import _ from "lodash";
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

const AllGamesMap = withScriptjs(withGoogleMap((props) =>
  <GoogleMap
    defaultZoom={12}
    defaultCenter={{ lat: 40.7634993, lng: -73.9902132 }}
  >
    {props.isMarkerShown && props.locations.map(loc => renderMarker(loc.id, loc.latitude, loc.longitude))}
  </GoogleMap>
));

export default AllGamesMap;
