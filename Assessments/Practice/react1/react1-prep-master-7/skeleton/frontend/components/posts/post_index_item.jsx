import React from 'react';
import { Link } from 'react-router-dom';

/*
Export a `PostIndexItem` presentational component that takes in a `post` and the
`deletePost` action via props. The component should render an `li` containing
the following:

1. A link to the post's show page with text of the post's title
2. A link to the post's edit page with text 'Edit'.
3. A button to delete the post.
*/

const PostIndexItem = ({post, deletePost}) => (
    <li>
        <Link to = {`/posts/${post.id}`}>{post.title}</Link>
        <Link to = {`/posts/${post.id}/edit`}>Edit</Link>
        <button onClick = {() => deletePost(post.id)}/>
    </li>
)

export default PostIndexItem