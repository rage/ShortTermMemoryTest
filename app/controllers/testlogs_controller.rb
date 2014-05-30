class TestlogsController < ApplicationController
  before_action :set_testlog, only: [:show, :edit, :update, :destroy]

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
  def edit
  end

  # POST /testlogs
  # POST /testlogs.json
  def create
    @testlog = Testlog.new(testlog_params)

    respond_to do |format|
      if @testlog.save
        format.html { redirect_to @testlog, notice: 'Testlog was successfully created.' }
        format.json { render action: 'show', status: :created, location: @testlog }
      else
        format.html { render action: 'new' }
        format.json { render json: @testlog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /testlogs/1
  # PATCH/PUT /testlogs/1.json
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

  # DELETE /testlogs/1
  # DELETE /testlogs/1.json
  def destroy
    @testlog.destroy
    respond_to do |format|
      format.html { redirect_to testlogs_url }
      format.json { head :no_content }
    end
  end

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
