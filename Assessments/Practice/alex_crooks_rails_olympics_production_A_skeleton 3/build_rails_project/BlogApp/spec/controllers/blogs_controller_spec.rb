require 'rails_helper'

RSpec.describe BlogsController, type: :controller do

    let(:user) do 
        User.create(email: "LivesToBlog@blog.com")
    end

    subject(:blog1) do 
        Blog.create!(title: "Blog 1 - Good Day", body: "today was good", author_id: user.id)
    end

    subject(:blog2) do 
        Blog.create!(title: "Blog 2 - Better Day", body: "today was great!", author_id: user.id)
    end

    describe "GET #index" do
        it "renders the index template and sets a @blogs variable for all Blogs in the database" do
            get :index
            #  creating our two blogs in our test database
            blog1
            blog2
            fetched_blogs = controller.instance_variable_get(:@blogs)
            expect(fetched_blogs).to eq(Blog.all)
            expect(response).to render_template(:index)
        end
    end

    describe "GET #show" do
        it "renders the show template and sets a @blog variable for the Blog matching the params id" do
            get :show, params: {id: blog1.id}
            fetched_blog = controller.instance_variable_get(:@blog)
            expect(fetched_blog).to eq(blog1)
            expect(response).to render_template(:show)
        end
    end

    describe "POST #create" do
        context "with valid params" do
            it "redirects to the blog's index page after a blog is created" do
                post :create, params: {
                    blog: {
                        title: "Day 3 - BEST DAY!",
                        body: "best day evar",
                        author_id: user.id
                    }
                }
                expect(Blog.exists?(:title => "Day 3 - BEST DAY!")).to be true
                expect(response).to redirect_to(blogs_url)
            end
        end

        context "with invalid params" do
            it "renders the new template if a blog does not NOT save to the database" do
                post :create, params: {
                    blog: {
                        title: "blank blank",
                        body: "",
                        author_id: user.id
                    }
                }
                expect(Blog.exists?(:title => "blank blank")).to be false
                expect(response).to render_template(:new)
            end
        end
    end

    describe "DELETE #destroy" do
            
        it "removes the blog from the database and redirects to the blog's index page" do
            blog3 =  Blog.create!(title: "Blog 3 - Boring Day", body: "nothing to say", author_id: user.id)
            delete :destroy, params: {id: blog3.id}
            expect(Blog.exists?(blog3.id)).to be false
            expect(response).to redirect_to(blogs_url)
        end
    end

end
