class UsersController < ApplicationController
    # new
    def new
        @user = User.new
        render :new
    end

    #create
    def create
        @user = User.new(user_param)
        if @user.save
            login(@user)
            redirect_to subs_url
        else
            flash.now[:errors] = ["Could not create user"]
            render :new
        end
    end

    # user params go here
    private
    def user_param
        params.require(:user).permit(:username, :password)
    end
end
