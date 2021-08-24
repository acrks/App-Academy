require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  subject (:jasmine) { User.create!(username: 'jasmine', password: 'abcdef') }
  let (:jack) { User.create!(username: 'jackyboy', password: 'abcdef') }

  describe 'GET #new' do
    it 'renders the new users template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with invalid params' do
      it 'validates the presence of the user\'s username and password and returns the user to the sign up page' do
        post :create, params: { user: { username: '', password: 'password' } }
        expect(response).to render_template(:new)
        expect(flash[:errors]).to eq(["Username can't be blank"])
      end

      it 'validates that the password is at least 6 characters long and returns the user to the sign up page' do
        post :create, params: { user: { username: 'jack_bruce', password: 'short' } }
        expect(response).to render_template(:new)
        expect(flash[:errors]).to eq(["Password is too short (minimum is 6 characters)"])
      end
    end

    context 'with valid params' do
      it 'redirects user to the poem\'s index on success' do
        post :create, params: { user: { username: 'jack_bruce', password: 'password' } }
        expect(response).to redirect_to(poems_url)
      end

      it 'logs in the user' do
        post :create, params: { user: { username: 'jack_bruce', password: 'abcdef' } }
        user = User.find_by_username('jack_bruce')

        expect(session[:session_token]).to eq(user.session_token)
      end
    end
  end
end
