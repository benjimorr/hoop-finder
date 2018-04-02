import axios from 'axios';
export const FETCH_FEED = "FETCH_FEED";

export function fetchRssFeed(feed) {
  let request = axios.get(feed)
    .catch(function(err) {
      console.error(err);
    })

  return {
    type: FETCH_FEED,
    payload: request
  }
}
