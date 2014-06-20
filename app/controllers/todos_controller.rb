class TodosController < ApplicationController
  # GET /todos
  # GET /todos.json
  def index
    if params[:ids]
      @todos = Todo.find(params[:ids])
    else
      @todos = Todo.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: { todos: @todos.as_json } }
    end
  end

  # GET /todos/1.json
  def show
    @todo = Todo.find(params[:id])

    respond_to do |format|
      format.json { render json: { todo: @todo.as_json } }
    end
  end

  # POST /todos.json
  def create
    @todo = Todo.new(todo_params)
    group = Group.find(params[:todo][:group_id])
    @todo.group = group

    respond_to do |format|
      if @todo.save
        format.json { render json: { todo: @todo.as_json }, status: :created, todo: @todo }
      else
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /todos/1.json
  def update
    @todo = Todo.find(params[:id])
    respond_to do |format|
      if @todo.update(todo_params)
        format.json { render json: { todo: @todo.as_json }, status: :ok }
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

  private
    def todo_params
      params[:todo].permit(:title, :details, :due, :completed, :group_id, :starred)
    end
end