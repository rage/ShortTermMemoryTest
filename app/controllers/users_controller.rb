class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter  :verify_authenticity_token

  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  #def show
  #end

  # GET /users/new
  #def new
  #  @user = User.new
  #end

  # GET /users/1/edit
  # def edit
  # end

  # POST /login
  def login
    @users = User.all
    user = @users.find_by username:params[:username]
    render json: !user.nil?
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if !(@user.sex == "f" or @user.sex == "m" or @user.sex == "o")
      return render json: FALSE
    end
    if !(@user.handedness == "l" or @user.handedness == "r")
      return render json: FALSE
    end

    render json: @user.save
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  #def update
  #  respond_to do |format|
  #    if @user.update(user_params)
  #      format.html { redirect_to @user, notice: 'User was successfully updated.' }
  #      format.json { head :no_content }
  #    else
  #      format.html { render action: 'edit' }
  #      format.json { render json: @user.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.permit(:username, :sex, :yearOfBirth, :handedness, :education)
  end
end
