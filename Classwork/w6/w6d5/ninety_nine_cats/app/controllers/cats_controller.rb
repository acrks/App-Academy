class CatsController < ApplicationController

    def index
        @cats = Cat.all
        render :index
    end

    def show
        @cat = Cat.find_by(id: params[:id])
        if @cat 
            render :show
        else
            render json: { error: "There is no cat with that ID." }, status: 404
        end
    end

    def new
        @cat = Cat.new
        render :new
    end

    def create
        @cat = Cat.new(params.require(:cat).permit(:name, :color, :sex, :birth_date, :description))

        if @cat.save
            redirect_to cat_url(@cat)
        else
            render json: @cat.errors.full_messages, status: 422
        end
        
        
    end
end