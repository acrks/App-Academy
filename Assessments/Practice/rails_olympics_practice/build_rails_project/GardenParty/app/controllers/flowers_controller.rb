class FlowersController < ApplicationController
    def new
        render :new
    end

    def create
        flower = Flower.new(new_flower_params)
        flower.save
        redirect_to garden_url(new_flower_params[:garden_id])
    end

    def destroy
        flower = Flower.find(params[:id])
        flower.delete
        redirect_to garden_url(flower.garden_id)
    end

    private
    def new_flower_params
        params.require(:flower).permit(:flower_type, :gardener_id, :garden_id)
    end
end