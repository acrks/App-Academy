class SessionsControllerController < ApplicationController
    before_action :require_no_user!, only: %i(create new)

    def create
      user = User.find_by_credentials(
        params[:user][:email],
        params[:user][:password]
      )
  
      if user
        login_user!(user)
        redirect_to root_url
      else
        render :new
      end
    end
  
    def destroy
      logout_user!
      redirect_to new_session_url
    end
  
    def new
      render :new
    end
end
