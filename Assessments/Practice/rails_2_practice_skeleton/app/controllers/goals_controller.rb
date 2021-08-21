class GoalsController < ApplicationController
    before_action :require_logged_in

    def create
        @goal = Goal.new(goal_params) 
        @goal.user_id = params[:user_id]
        
        if !@goal.save
            flash[:errors] = ["Details can't be blank"]
        end
        redirect_to user_url(@goal.user_id)
    end

    def destroy
        @goal = current_user.goals.find_by(id: params[:id])
        if @goal && @goal.user_id = current_user.id
            @goal.delete
            redirect_to users_url
        end
    end

    private
    def goal_params
        params.require(:goal).permit(:name, :details, :status)
    end
end
