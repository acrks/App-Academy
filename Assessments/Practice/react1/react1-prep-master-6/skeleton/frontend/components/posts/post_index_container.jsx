import { connect } from 'react-redux';
import PostIndex from './post_index';
import { fetchPosts, deletePost } from '../../actions/post_actions';

/*
Export a container component for the `PostIndex` that maps an array of all posts
from the store as a `posts` prop. Additionally, it should map in functions that
will dispatch `fetchPosts` and `deletePost` to the store as props of the same
name.
*/

const mapStateToProps = (state) => ({
    posts: Object.values(state.posts)
})

const mapDispatchToProps = (dispatch) => ({
    fetchPosts: posts => dispatch(fetchPosts(posts)),
    deletePost: () => dispatch(deletePost())
})

export default connect(mapStateToProps, mapDispatchToProps)(PostIndex)