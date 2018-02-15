import axios from 'axios';
export const CREATE_COURT = "CREATE_COURT";

export function createCourt(values) {
    console.log(values);

    return {
        type: CREATE_COURT,
        payload: null
    }
}
