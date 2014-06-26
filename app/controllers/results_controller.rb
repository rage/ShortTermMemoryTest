class ResultsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  # GET /results/1
  # GET /results/1.json
  def show
  end

  # GET /results/1/edit
  def edit
  end

  # POST /results
  # POST /results.json
  def create
    #byebug
    params[:result].each do |key,entry|
      puts key
      #byebug
      @result = Result.find_or_create_by(entry)
      @result.save
      if @result.errors.size != 0
        return render json: {head: "error"}
      end
    end
    render json: {head: "ok"}
  end
end
