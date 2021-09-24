/*
Export the following API Util functions with the specified parameters:

1. `fetchPosts`
2. `fetchPost(postId)`
3. `createPost(post)`
4. `updatePost(post)`
5. `deletePost(postId)`
*/

export const fetchPosts = () => (
    $.ajax ({
        method: 'GET',
        url: "api/posts"
    })
)

export const fetchPost = (postId) => (
    $.ajax ({
        method: 'GET',
        url: `api/posts/${postId}`
    })
)

export const createPost = (post) => (
    $.ajax ({
        method: 'POST',
        url: `api/posts`,
        data: {post}
    })
)

export const updatePost = (post) => (
    $.ajax ({
        method: 'PATCH',
        url: `api/posts/${post.id}`,
        data: {post}
    })
)

export const deletePost = (postId) => (
    $.ajax ({
        method: 'DELETE',
        url: `api/posts/${postId}`
    })
)