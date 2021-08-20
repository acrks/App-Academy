class SubsController < ApplicationController
    # index
    before_action :require_logged_in, except: [:index]

    def index
        @subs = Sub.all
        render :index
    end

    def show
        @sub = Sub.find_by(id: params[:id])
        if @sub
            render :show
        else
            flash[:errors] = ["No sub by that name, create it!"]
            redirect_to new_sub_url
        end
    end

    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(sub_param)
        @sub.moderator_id = current_user.id
        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = ["Unable to create sub, please try again"]
            render :new
        end
    end

    def update
        @sub = Sub.find_by(id: params[:id])
        if @sub.nil?
            flash[:errors] = ["Sub does not exist"]
            redirect_to subs_url
        end
        
        if @sub.moderator_id == current_user.id
            if @sub.update(sub_param) 
                redirect_to sub_url(@sub)
            else
                flash.now[:errors] = ["Cannot update sub, try again"]
                render :edit
            end
        end
    end

    def edit
        @sub = Sub.find_by(id: params[:id])
        render :edit
    end

    def destroy
        @sub = Sub.find_by(id: params[:id])
        if @sub
            @sub.delete
        else
            flash[:errors] = ["Sub does not exist, cannot delete"]
        end
        redirect_to subs_url
    end

    private
    def sub_param
        params.require(:sub).permit(:title, :description, :moderator_id)
    end
end
