/*
Export the following API Util functions with the specified parameters:

1. `fetchPosts`
2. `fetchPost(postId)`
3. `createPost(post)`
4. `updatePost(post)`
5. `deletePost(postId)`
*/

export const fetchPosts = () => {
    return $.ajax({
        url: '/api/posts',
        method: 'GET'
    })
}

export const fetchPost = (postId) => {
    return $.ajax({
        url: `/api/posts/${postId}`,
        method: 'GET'
    })
}

export const createPost = (post) => {
    return $.ajax({
        url: `/api/posts`,
        method: 'POST',
        data: {post}
    })
}

export const updatePost = (post) => {
    return $.ajax({
        url: `/api/posts/${post.id}`,
        method: 'PATCH',
        data: {post}
    })
}

export const deletePost = (postId) => {
    return $.ajax({
        url: `/api/posts/${postId}`,
        method: 'DELETE',
    })
}