import {
  RECEIVE_ALL_POSTS,
  RECEIVE_POST,
  REMOVE_POST,
} from '../actions/post_actions';
import merge from 'lodash/merge';

/*
Export a `PostsReducer` that takes in the old state and appropriately handles
all post actions.
*/

const PostsReducer = (state = {}, action) => {
  Object.freeze(state)
  const nextState = Object.assign({}, state)
  switch(action.type) {
    case RECEIVE_ALL_POSTS:
      return {...state, ...action.posts}
    case RECEIVE_POST:
      nextState[action.post.id] = action.post
      return nextState
    case REMOVE_POST:
      delete nextState[action.postId]
      return nextState
    default:
      return state
  }
}

export default PostsReducer
