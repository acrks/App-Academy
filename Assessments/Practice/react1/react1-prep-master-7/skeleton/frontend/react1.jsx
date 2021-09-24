import React from "react";
import ReactDOM from "react-dom";
import Root from "./components/root";
import configureStore from "./store/store";

/*
Write an entry point file that renders the `Root` component, with a `store`
prop passed in, inside the div with id 'root'.
*/

document.addEventListener("DOMContentLoaded", () => {
    const store = configureStore()
    const root = document.getElementById("root")
    ReactDOM.render(<Root store ={store}/>, root)
})
