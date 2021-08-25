class PoemsController < ApplicationController    
    before_action :require_logged_in
    
    def new
        @poem = Poem.new
        render :new
    end

    def index
        @poems = Poem.all
        render :index
    end

    def create
        @poem = Poem.new(poem_params)
        @poem.author_id = current_user.id
        if @poem.save
            redirect_to poems_url
        else
            flash[:errors] = @poem.errors.full_messages
            render :new
        end
    end

    def edit
        @poem = Poem.find_by(id: params[:id])
        render :edit
    end

    def update
        @poem = current_user.poems.find_by(id: params[:id])
        if @poem && @poem.update(poem_params)
            redirect_to poems_url
        else
            flash[:errors] = ["Something went wrong!"]
            render :edit
        end
    end

    def poem_params
        params.require(:poem).permit(:title, :stanzas, :complete)
    end
end
