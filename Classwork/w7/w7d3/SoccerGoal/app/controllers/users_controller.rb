class UsersController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    def index
        @users = User.all
        render :index
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login_user!(@user)
            redirect_to user_url(@user)
        else
            flash[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
