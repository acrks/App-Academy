class UsersController < ApplicationController
    
    before_action :require_logged_in, only: [:show, :index]
    
    def new
        @user = User.new
        render :new    
    end

    def create
        @user = User.create(user_params)
        if @user.save
            login(@user)
            redirect_to users_url
        else
            flash[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def index
        if logged_in?
            @users = User.all
            render :index
        else
            redirect_to new_session_url
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        if logged_in?
            render :show
        else
            redirect_to new_session_url
        end
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end

end
