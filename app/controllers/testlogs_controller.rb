class TestlogsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  # POST /testlogs
  # POST /testlogs.json
  def create
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

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def testlog_params
      params.require(:testlog).permit(:testcase_id, :eventtype, :value, :timestamp)
    end


end
