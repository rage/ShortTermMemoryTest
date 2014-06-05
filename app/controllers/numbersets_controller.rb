class NumbersetsController < ApplicationController
  before_action :set_numberset, only: [:show, :edit, :update, :destroy]
  skip_before_filter  :verify_authenticity_token

  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  # GET /numbersets
  # GET /numbersets.json
  def index
    @numbersets = Numberset.all
  end

  # GET /numbersets/1
  # GET /numbersets/1.json
  def show
  end

  # GET /numbersets/new
  def new
    @numberset = Numberset.new
  end

  # GET /numbersets/1/edit
  def edit
  end

  # POST /numbersets
  # POST /numbersets.json
  def create
    @numberset = Numberset.new(numberset_params)

    respond_to do |format|
      if @numberset.save
        format.html { redirect_to @numberset, notice: 'Numberset was successfully created.' }
        format.json { render action: 'show', status: :created, location: @numberset }
      else
        format.html { render action: 'new' }
        format.json { render json: @numberset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /numbersets/1
  # PATCH/PUT /numbersets/1.json
  def update
    respond_to do |format|
      if @numberset.update(numberset_params)
        format.html { redirect_to @numberset, notice: 'Numberset was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @numberset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /numbersets/1
  # DELETE /numbersets/1.json
  def destroy
    @numberset.destroy
    respond_to do |format|
      format.html { redirect_to numbersets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_numberset
      @numberset = Numberset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def numberset_params
      params.require(:numberset).permit(:position, :list_id, :length, :order)
    end
end
