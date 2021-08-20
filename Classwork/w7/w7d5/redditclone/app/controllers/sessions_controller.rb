class SessionsController < ApplicationController
    # new
    def new
        @user = User.new
        render :new
    end
    
    # create
    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user
            login(@user)
            redirect_to subs_url
        else
            flash[:errors] = ["Access Denied"]
            redirect_to new_session_url
        end
    end

    # destroy
    def destroy
        logout!
        redirect_to new_session_url
    end
end
