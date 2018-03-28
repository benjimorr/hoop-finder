import { FETCH_FEED } from '../actions/index';

export default function(state = [], action) {
  switch(action.type) {
    case FETCH_FEED:
      if(action.payload) {
        return action.payload;
      } else {
        state = [];
      }
  }
  return state;
}
