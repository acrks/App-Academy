class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to user_url(@user)
    else
      render json: { error: "Could not create user." }, status: 422
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:user_name, :password_digest, :session_token)
  end
end
