class TagsController < ApplicationController
  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.all

    respond_to do |format|
      format.html # index.html.erb
      format.json do
        render :json => @tags.to_json
      end
    end
  end

  # GET /tags/1.json
  def show
    @tag = Tag.find(params[:id])

    respond_to do |format|
      format.json { render json: @tag }
    end
  end

  # POST /tags.json
  def create
    @tag = Tag.new(parmas[:tag])

    respond_to do |format|
      if @tag.save
        format.json { render json: @tag, status: :created, todo: @tag }
      else
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tags/1.json
  def update
    @tag = Tag.find(params[:id])

    respond_to do |format|
      if @tag.update_attributes(params[:tag])
        format.json { render json: @tag, status: :ok }
      else
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1.json
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    respond_to do |format|
      format.json { render json: nil, status: :ok }
    end
  end
end