class BlogsController < ApplicationController
    def index
        @blogs = Blog.all
    end

    def show
        @blog = Blog.find(params[:id])
    end

    def create
        blog = Blog.new(new_blog_params)
        if blog.save
            redirect_to blogs_url
        else
            render :new
        end
    end

    def destroy
        blog = Blog.find_by(id: params[:id])
        blog.delete
        redirect_to blogs_url
    end

    private
    def new_blog_params
        params.require(:blog).permit(:title, :body, :author_id)
    end
end