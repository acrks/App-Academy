class UsersController < ApplicationController

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            login(@user)
            redirect_to poems_url           
        else
            flash[:errors] = @user.errors.full_messages
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
