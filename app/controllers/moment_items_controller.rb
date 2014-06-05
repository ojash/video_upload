class MomentItemsController < ApplicationController
  before_action :set_moment_item, only: [:show, :edit, :update, :destroy]

  # GET /moment_items
  # GET /moment_items.json
  def index
    @moment_items = MomentItem.all
  end

  # GET /moment_items/1
  # GET /moment_items/1.json
  def show
  end

  # GET /moment_items/new
  def new
    @moment_item = MomentItem.new
  end

  # GET /moment_items/1/edit
  def edit
  end

  # POST /moment_items
  # POST /moment_items.json
  def create
    @moment_item = MomentItem.new(moment_item_params)

    respond_to do |format|
      if @moment_item.save
        format.html { redirect_to @moment_item, notice: 'Moment item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @moment_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @moment_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moment_items/1
  # PATCH/PUT /moment_items/1.json
  def update
    respond_to do |format|
      if @moment_item.update(moment_item_params)
        format.html { redirect_to @moment_item, notice: 'Moment item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @moment_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moment_items/1
  # DELETE /moment_items/1.json
  def destroy
    @moment_item.destroy
    respond_to do |format|
      format.html { redirect_to moment_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moment_item
      @moment_item = MomentItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def moment_item_params
      params.require(:moment_item).permit(:title, :video, :audio)
    end
end
