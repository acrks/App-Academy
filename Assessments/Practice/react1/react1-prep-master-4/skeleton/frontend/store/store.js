import { createStore, applyMiddleware } from 'redux';
import RootReducer from '../reducers/root_reducer';
import thunk from 'redux-thunk';
import { configure } from 'enzyme';

/*
Export a `configureStore` function that takes in a `preloadedState` parameter
and returns a store created with the `RootReducer`, `preloadedState`, and
`thunk` middleware.
*/

const configureStore = (preloadedState) => {
    return createStore(
        RootReducer,
        preloadedState,
        applyMiddleware(thunk)
    )
}

export default configureStore;
