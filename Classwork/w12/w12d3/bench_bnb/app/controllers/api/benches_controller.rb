class Api::BenchesController < ApplicationController
    def index
        @benches = Bench.all
    end

    def create
        @bench = Bench.new(bench_params)
        if @bench.save
          redirect_to api_benches_url(@bench)
        else
          # Tell the user that something went wrong. Let them try again.
          flash.now[:errors] = @bench.errors.full_messages
          render :new
        end
    end

    def bench_params
        params.require(:bench).permit(:description, :lat, :lng)
    end    
end
