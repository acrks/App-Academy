class GoalsController < ApplicationController
    before_action :require_logged_in, only:[:create, :destroy]
    
    def create
        @goal = Goal.create(goal_params)
        @goal.user_id = params[:user_id]
        if !@goal.save
            flash[:errors] = ["Details can't be blank"]
        end
        redirect_to user_url(@goal.user)
    end

    def destroy
        @goal = Goal.find_by(id: params[:id])
        if @goal && @goal.user == current_user
            @goal.delete
            redirect_to users_url
        end
    end

    def goal_params
        params.require(:goal).permit(:name, :details, :status)
    end
end
