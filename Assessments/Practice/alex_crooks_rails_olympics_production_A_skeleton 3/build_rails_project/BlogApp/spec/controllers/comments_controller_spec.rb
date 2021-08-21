require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
    let(:user1) do 
        User.create(email: "BillyBlogger@blog.com")
    end

    let(:user2) do 
        User.create(email: "Bella_the_Blogger@blog.com")
    end

    let(:blog1) do 
        Blog.create(title: "Blogging Blues", body: "I love the color blue and blogging!", author_id: user1.id)
    end

    describe "POST #create" do
        context "with valid params" do

            it "redirects to the blog's show page after a comment is created" do
                post :create, params: {
                    comment: {
                        body: "I also like blue!",
                        author_id: user2.id,
                        blog_id: blog1.id
                    }
                }
                expect(Comment.exists?(:body => "I also like blue!")).to be true
                expect(response).to redirect_to(blog_url(blog1.id))
            end
        end

        context "with invalid params" do
            it "redirects to the blog's show page if comment is NOT created" do
                post :create, params: {
                    comment: {
                        body: "",
                        author_id: user1.id,
                        blog_id: blog1.id
                    }
                }
                expect(Comment.exists?(:body => "")).to be false
                expect(response).to redirect_to(blog_url(blog1.id))
            end
        end
    end

    describe "DELETE #destroy" do
        it "removes the comment from the database and redirects to the blog's show page" do
            comment = Comment.create!(body: "i do not like blogging", author_id: user2.id, blog_id: blog1.id)
            delete :destroy, params: {id: comment.id}
            expect(Comment.exists?(comment.id)).to be false
            expect(response).to redirect_to(blog_url(blog1.id))
        end
    end
end
