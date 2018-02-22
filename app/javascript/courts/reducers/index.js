import { combineReducers } from 'redux';
import { reducer as formReducer } from 'redux-form';
import GeocodeAddressReducer from './geocode_address';
import NearbyCourtReducer from './nearby_courts';

const rootReducer = combineReducers({
  geocodedAddress: GeocodeAddressReducer,
  nearbyCourts: NearbyCourtReducer,
  form: formReducer
});

export default rootReducer;
