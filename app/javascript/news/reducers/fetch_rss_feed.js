import { FETCH_FEED } from '../actions/index';
var parser = new DOMParser();

export default function(state = [], action) {
  switch(action.type) {
    case FETCH_FEED:
      if(action.payload) {
        let xmlDoc = parser.parseFromString(action.payload.data,"text/xml");
        var itemArr = [].slice.call(xmlDoc.children[0].children[0].children).filter(node => node.localName === "item");
        return itemArr;
      } else {
        state = [];
      }
  }
  return state;
}
