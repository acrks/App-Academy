import { combineReducers } from 'redux';
import PostsReducer from './posts_reducer';

/*
Export a `RootReducer` that sets up a `posts` slice of state, which delegates
to the `PostsReducer`.
*/

export default combineReducers({posts: PostsReducer})
