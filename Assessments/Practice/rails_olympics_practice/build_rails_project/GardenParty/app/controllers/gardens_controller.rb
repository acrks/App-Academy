class GardensController < ApplicationController
    def new
        render :new
    end

    def index
        @gardens = Garden.all
    end

    def show
        @garden = Garden.find_by(id: params[:id])
    end

    def create
        garden = Garden.new(new_garden_params)
        if garden.save
            redirect_to gardens_url
        else
            render :new
        end
    end

    private
    def new_garden_params
        params.require(:garden).permit(:name, :size, :garden_owner_id)
    end
end