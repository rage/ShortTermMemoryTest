class UsersController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  # POST /login
  def login
    # @users = User.all
    # user = @users.find_by username:params[:username]
    # render json: !user.nil?
    @users = User.all
    user = @users.find_by username:params[:username]
    if !user.nil?
      @testcases = Testcase.where user_id:user.id, finished:true, training:true
      if(@testcases.length>0)
        render json: "{\"isReserved\":true, \"isTrained\": true}"
      else
        render json: "{\"isReserved\":true, \"isTrained\": false}"
      end
    else
      render json: "{\"isReserved\":false, \"isTrained\": false}"
    end

  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if !(@user.sex == "f" or @user.sex == "m")
      return render json: FALSE
    end
    if !(@user.handedness == "l" or @user.handedness == "r")
      return render json: FALSE
    end

    render json: @user.save
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.permit(:username, :sex, :yearOfBirth, :handedness, :education)
  end
end
