class ResultsController < ApplicationController
  before_action :set_result, only: [:show, :edit, :update, :destroy]

  skip_before_filter  :verify_authenticity_token

  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers


  # GET /results
  # GET /results.json
  def index
    @results = Result.all
  end

  # GET /results/1
  # GET /results/1.json
  def show
  end

  # GET /results/new
  def new
    @result = Result.new
  end

  # GET /results/1/edit
  def edit
  end



  # POST /results
  # POST /results.json
  def create
    #byebug
    #params[:result].each do |key,entry|
    #  puts key
    #  byebug
    #  @result = Result.find_or_create_by(entry)
    #  @result.save
    #  if @result.errors.size != 0
    #    return render json: {head: "error"}
    #  end
    #end
    render json: {head: "ok"}
  end





  # PATCH/PUT /results/1
  # PATCH/PUT /results/1.json
  def update
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to @result, notice: 'Result was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    @result.destroy
    respond_to do |format|
      format.html { redirect_to results_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params
      params.require(:result).permit(:testcase_id, :keypressed, :keypressindex, :last_series, :timestamp)
    end
end
