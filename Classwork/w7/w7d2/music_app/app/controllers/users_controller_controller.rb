class UsersControllerController < ApplicationController
    def new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login_user!(@user)
            redirect_to root_url
        else
            render :new 
        end
    end

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
