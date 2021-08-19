require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
    background :each do 
        visit new_user_path
    end
  scenario 'has a new user sign up page' do
    expect(page).to have_content('Create User')
    expect(page).to have_content('Sign Up')
  end
  scenario 'takes in a username and password' do 
    expect(page).to have_content('Username')
    expect(page).to have_content('Password')
  end

  scenario 'redirect to users show page and display username on page' do
    fill_in 'Username', with: 'username'
    fill_in 'Password', with: 'password'

    click_button 'Create User'
    # save_and_open_page

    expect(page).to have_content('Username')
    user = User.find_by(username: 'username')
    expect(current_path).to eq(user_path(user))
  end
end


feature 'logging in' do
    background :each do 
        visit users_path
    end
    scenario 'shows username on the homepage after login' do
        FactoryBot.create(:user, username: 'username2')
        user1 = User.find_by(username: 'username2')
        login_as(user1)
        expect(page).to have_content(user1.username)
    end
end

# feature 'logging out' do
#   scenario 'begins with a logged out state'

#   scenario 'doesn\'t show username on the homepage after logout'

# end