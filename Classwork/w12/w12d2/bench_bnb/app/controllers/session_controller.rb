class SessionsController < ApplicationController

   before_action :require_logged_in, only: [:destroy]

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if @user
      login!(@user)
      redirect_to users_url
    else
      flash.now[:errors] = ['Invalid username or password']
      render :new
    end
  end

  def destroy
    if !current_user
        # render json: 
        flash['Could not log out!'], status:404
        redirect_to new_session_url
    else
        logout!
    end
  end
end
