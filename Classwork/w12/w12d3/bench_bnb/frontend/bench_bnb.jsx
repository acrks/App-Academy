import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";
import Root from './components/root'
import {fetchBenches} from './actions/bench_actions'

document.addEventListener("DOMContentLoaded", () => {
    const store = configureStore();

    window.dispatch = store.dispatch;
    window.getState = store.dispatch;
    window.fetchBenches = fetchBenches();
    
    // now we can test our code from the console
    dispatch(fetchBenches()).then(console.log());

    const root = document.getElementById("root");
    ReactDOM.render(<Root store={store} />, root);

});