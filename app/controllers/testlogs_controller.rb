class TestlogsController < ApplicationController
  before_action :set_testlog, only: [:show, :edit, :update, :destroy]
  skip_before_filter  :verify_authenticity_token

  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  # GET /testlogs
  # GET /testlogs.json
  def index
    @testlogs = Testlog.all
  end

  # GET /testlogs/1
  # GET /testlogs/1.json
  def show
  end

  # GET /testlogs/new
  def new
    @testlog = Testlog.new
  end

  # GET /testlogs/1/edit
=begin
  def edit
  end
=end

  # POST /testlogs
  # POST /testlogs.json
  def create
    #byebug
    params[:testlog].each do |key,entry|
      puts key
      @testlog = Testlog.find_or_create_by(entry)
      @testlog.save
      if @testlog.errors.size != 0
        return render json: {head: "error"}
      end
    end
    render json: {head: "ok"}
  end

  # PATCH/PUT /testlogs/1
  # PATCH/PUT /testlogs/1.json
=begin
  def update
    respond_to do |format|
      if @testlog.update(testlog_params)
        format.html { redirect_to @testlog, notice: 'Testlog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @testlog.errors, status: :unprocessable_entity }
      end
    end
  end
=end

  # DELETE /testlogs/1
  # DELETE /testlogs/1.json
=begin
  def destroy
    @testlog.destroy
    respond_to do |format|
      format.html { redirect_to testlogs_url }
      format.json { head :no_content }
    end
  end
=end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testlog
      @testlog = Testlog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def testlog_params
      params.require(:testlog).permit(:testcase_id, :eventtype, :value, :timestamp)
    end
end
