class Api::TodosController < ApplicationController
    def show
        render json: Todo.find(params[:id])
    end

    def create
        @todo = Todo.new(todo_params)
        if @todo.save
          render json: @todo
        else
          render json: @todo.errors.full_messages, status: 422
        end
    end

    # update
    def update
        @todo = Todo.find_by(id: params[:id])
        if @todo.nil?
            flash[errors] = ["To Do does not exist"]
        end

        if !@todo.update(todo_params)
        else
            @todo.errors.full_messages, status: 422
        end
    end

    def index
        todos = Todos.all
        render json: api_todos
    end

    def destroy
        @todo = Todo.find_by(id: params[:id])
        if @todo
            @todo.delete
        else
            flash[errors] = ["To Do does not exist, cannot delete"]
        end
        render json: api_todos
    end

    def todo_params
        params.require(:todo).permits(:title, :body, :done)
    end


end
