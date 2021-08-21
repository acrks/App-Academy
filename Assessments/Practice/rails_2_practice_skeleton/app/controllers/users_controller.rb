class UsersController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def index
        if logged_in?
            @users = User.all
            render :index
        else
            redirect_to new_session_url
        end
    end

    def create
        @user = User.create(user_params)
        if @user.save
            login(@user)
            redirect_to users_url
        else
            flash[:errors] = ["Password is too short (minimum is 6 characters)"]
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
        if logged_in?
            render :show
        else
            redirect_to new_session_url
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
