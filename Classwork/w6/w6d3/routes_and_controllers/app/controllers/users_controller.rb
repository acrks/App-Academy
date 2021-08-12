# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    # render plain: "I'm in the index action!"

    @users = User.all
    render json: @users
  end

  def create
    user = User.new(params.require(:user).permit(:name, :email))
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find_by(id: params[:id])
    if user
      render json: user
    else
      render json: { error: 'There is no user with that id.' }, status: 404
    end
  end

  def update
    user = User.find_by(id: params[:id])
    if user.nil?
      render json: { error: 'There is no user with that id.' }, status: 404
      return
    end

    if user.update(user_params)
      redirect_to user_url(user)
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user
      user.destroy
      redirect_to user_url
    else
      render json: { error: 'There is no user with that id.' }, status: 404
    end
  end

  private

  # these are our strong params
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
