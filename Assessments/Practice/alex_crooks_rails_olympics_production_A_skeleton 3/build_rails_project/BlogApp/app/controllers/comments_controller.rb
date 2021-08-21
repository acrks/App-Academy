class CommentsController < ApplicationController
    def create
        comment = Comment.new(new_comment_params)
        comment.save
        redirect_to blog_url(comment.blog_id)
    end

    def destroy
        comment = Comment.find_by(id: params[:id])
        comment.delete
        redirect_to blog_url(comment.blog_id)
    end


    private
    def new_comment_params
        params.require(:comment).permit(:body, :author_id, :blog_id)
    end
end