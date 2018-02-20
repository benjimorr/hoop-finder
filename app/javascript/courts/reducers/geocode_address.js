import { FIND_ADDRESS } from '../actions/index';

export default function(state = [], action) {
    switch(action.type) {
        case FIND_ADDRESS:
            if(action.payload) {
                if(action.payload.data.status === "ZERO_RESULTS") {
                    alert("Invalid address. Please try again.");
                    state = [];
                } else {
                    const { lat, lng } = action.payload.data.results[0].geometry.location;
                    return [lat, lng];
                }
            } else {
                state = [];
            }
    }
    return state;
}
