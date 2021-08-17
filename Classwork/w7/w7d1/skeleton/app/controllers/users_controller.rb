class UsersController < ApplicationController
  before_action :require_logged_in, except: [:create, :new] # we did only instead of except

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to user_url
    else
      render json: { error: "Could not create user." }, status: 422
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
