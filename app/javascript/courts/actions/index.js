import axios from 'axios';
export const CREATE_COURT = "CREATE_COURT";

export function createCourt(values, apiKey) {
    const streetAddress = values.streetAddress.split(' ').join('+');
    const city = values.city.split(' ').join('+');
    const fullAddress = `${streetAddress},+${city},+${values.state}`;

    const request = axios.get(`https://maps.googleapis.com/maps/api/geocode/json?address=${fullAddress}&key=${apiKey}`)
        .then((response) => {
            const { lat, lng } = response.data.results[0].geometry.location;
            return axios.get(`https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${lat},${lng}&radius=5000&keyword=basketball+court&key=${apiKey}`);
        })
        .then((response) => {
            console.log(response);
        })
        .catch(function(error) {
            console.log(error);
        });

    return {
        type: CREATE_COURT,
        payload: null
    }
}
