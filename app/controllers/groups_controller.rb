class GroupsController < ApplicationController
  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: { groups: @groups.map { |g| g.attributes.merge(:todo_ids => g.todos.map(&:id)) }.as_json } }
    end
  end

  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])

    respond_to do |format|
      format.json { render json: { group: @group.as_json } }
    end
  end

  # POST /groups.json
  def create
    @group = Group.new(parmas[:tag])

    respond_to do |format|
      if @group.save
        format.json { render json: @group, status: :created, todo: @group }
      else
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1.json
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:tag])
        format.json { render json: @group, status: :ok }
      else
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1.json
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.json { render json: nil, status: :ok }
    end
  end
end