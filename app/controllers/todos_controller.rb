class TodosController < ApplicationController
  # GET /todos
  # GET /todos.json
  def index
    @todos = Todo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @todos }
    end
  end

  # GET /todos/1.json
  def show
    @todo = Todo.find(parmas[:id])

    respond_to do |format|
      format.json { render json: @todo }
    end
  end

  # POST /todos.json
  def create
    @todo = Todo.new(parmas[:todo])

    respond_to do |format|
      if @todo.save
        format.json { render json: @todo, status: :created, todo: @todo }
      else
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /todos/1.json
  def update
    @todo = Todo.find(params[:id])

    respond_to do |format|
      if @todo.update_attributes(params[:todo])
        format.json { render json: @todo, status: :ok }
      else
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1.json
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    respond_to do |format|
      format.json { render json: nil, status: :ok }
    end
  end
end