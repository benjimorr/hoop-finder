import { combineReducers } from 'redux';
import { reducer as formReducer } from 'redux-form';
import FetchRssFeedReducer from './fetch_rss_feed';

const rootReducer = combineReducers({
  feedResults: FetchRssFeedReducer,
  form: formReducer
});

export default rootReducer;
