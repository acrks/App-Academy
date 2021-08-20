class PostsController < ApplicationController
    # everything except index
    before_action :require_logged_in

    def new
        @post = Post.new
        render :new
    end

    def create
        @post = Post.new(post_param)
        @post.author_id = current_user.id
        if @post.save
            redirect_to post_url(@post)
        else
            flash.now[errors] = ["Unable to create post, please try again"]
            render :new
        end
    end

    def show
        @post = Post.find_by(id: params[:id])
        if @post
            render :show
        else
            flash[errors] = ["No post with that title, create it!"]
            redirect_to new_post_url
        end
    end

    def update
        @post = Post.find_by(id: params[:id])

        if @post.nil?
            flash[errors] = ["Post does not exist"]
            redirect_to posts_url
        end

        if @post.author_id == current_user.id
            if @post.update(post_param)
                redirect_to post_url(@post)
            else
                flash.now[errors] = ["Cannot update post, try again"]
                render :edit
            end
        end
    end

    def edit
        @post = Post.find_by(id: params[:id])
        render :edit
    end

    def destroy
        @post = Post.find_by(id: params[:id])
        if @post
            @post.delete
        else
            flash[errors] = ["Post does not exist, cannot delete"]
        end
        redirect_to posts_url
    end

    private
    def post_param
        params.require(:post).permit(:title, :url, :content, :sub_id, :author_id)
    end
    # 
end
