class SessionsController < ApplicationController
    before_action :require_logged_in, only:[:destroy]
    
    def new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user
            login(@user)
            redirect_to poems_url
        else
            flash[:errors] = ["Invalid username or password"]
            render :new
        end
    end

    def destroy
        logout if logged_in?
        redirect_to new_session_url
    end
end
