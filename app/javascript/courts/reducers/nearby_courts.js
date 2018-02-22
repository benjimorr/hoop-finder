import { NEARBY_COURTS } from '../actions/index';

export default function(state = [], action) {
    switch(action.type) {
        case NEARBY_COURTS:
            if(action.payload) {
                return action.payload;
            } else {
                state = [];
            }
    }
    return state;
}
