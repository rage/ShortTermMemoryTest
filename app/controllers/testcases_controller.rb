class TestcasesController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  # GET /testcases/1
  # GET /testcases/1.json
  def show
  end

  # GET /testcases/1/edit
  def edit
  end

  #POST /testcases/finish
  def finish
    @testcase = Testcase.find_by id:(params[:id])
    if @testcase.nil?
      render json: false
    else
      @testcase.finished = true
      @testcase.save
      render json: @testcase.finished
    end

  end
end
