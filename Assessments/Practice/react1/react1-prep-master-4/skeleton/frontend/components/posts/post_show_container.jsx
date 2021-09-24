import { connect } from 'react-redux';
import PostShow from './post_show';
import { fetchPost } from '../../actions/post_actions';

/*
Export a container component for the `PostShow` that maps in the appropriate
post from the store as a `post` prop. Additionally, it should map in
a function that will dispatch `fetchPost` to the store as a prop of the same
name.
*/

const mapState = (state, ownProps) => ({
    post: state.posts[ownProps.match.params.postId]
})

const mapDispatch = dispatch => ({
    fetchPost: post => dispatch(fetchPost(post))
})

export default connect(mapState, mapDispatch)(PostShow)