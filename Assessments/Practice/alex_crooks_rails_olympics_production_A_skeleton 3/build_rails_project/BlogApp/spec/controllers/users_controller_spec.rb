require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    subject(:user) do 
        User.create(email: "BellaBlogsItAll@blog.com")
    end

    describe "GET #show" do
        it "renders the show template and sets a @user variable for the User matching the params id" do
            get :show, params: {id: user.id}
            fetched_user = controller.instance_variable_get(:@user)
            expect(fetched_user).to eq(user)
            expect(response).to render_template(:show)
        end
    end

    describe "POST #create" do
        context "with valid params" do
            it "redirects to the blog index page after a user is created" do
                post :create, params: {
                    user: {
                        email: "blogging@blog.com",
                    }
                }
                expect(User.exists?(:email => "blogging@blog.com")).to be true
                expect(response).to redirect_to(blogs_url)
            end
        end

        context "with invalid params" do
            it "renders the new template if a user cannot be created" do
                post :create, params: {
                    user: {
                        email: "",
                    }
                }
                expect(User.exists?(:email => "")).to be false
                expect(response).to render_template(:new)
            end
        end
    end
end
