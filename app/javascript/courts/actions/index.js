import axios from 'axios';
export const FIND_ADDRESS = "FIND_ADDRESS";
export const NEARBY_COURTS = "NEARBY_COURTS";

export function geocodeAddress(values, apiKey) {
    let streetAddress = values.streetAddress.split(' ').join('+');
    let city = values.city.split(' ').join('+');
    let fullAddress = `${streetAddress},+${city},+${values.state}`;

    let request = axios.get(`https://maps.googleapis.com/maps/api/geocode/json?address=${fullAddress}&key=${apiKey}`)
        .catch(function(err) {
            console.error(err);
        })

    return {
        type: FIND_ADDRESS,
        payload: request
    }
}

export function findNearbyCourts(lat, lng) {
    return (dispatch) => {
        let pyrmont = new google.maps.LatLng(lat, lng);
        let map = new google.maps.Map(document.getElementById('courts-map'), {
            center: pyrmont,
            zoom: 15
        });

        let placesRequest = {
            location: pyrmont,
            radius: '500',
            query: 'basketball court'
        };

        let service = new google.maps.places.PlacesService(map);
        service.textSearch(placesRequest, (response, status) => {
            dispatch(setNearbyCourts(response, status));
        });
    }
}

function setNearbyCourts(response, status) {
    return {
        type: NEARBY_COURTS,
        payload: response
    }
}
