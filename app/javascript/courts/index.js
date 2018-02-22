import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { createStore, applyMiddleware } from 'redux';
import ReduxPromise from 'redux-promise';
import thunk from 'redux-thunk';
import App from './components/App';
import reducers from './reducers';

const createStoreWithMiddleware = applyMiddleware(ReduxPromise, thunk)(createStore);

const node = document.getElementById('new-court');
const apiKey = node.getAttribute('data-api-key');
const authToken = node.getAttribute('data-auth-token');

ReactDOM.render(
    <Provider store={createStoreWithMiddleware(reducers)}>
        <App apiKey={apiKey} authToken={authToken} />
    </Provider>,
    node
);
