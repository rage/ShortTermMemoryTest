class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  skip_before_filter  :verify_authenticity_token

  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers


  # GET /lists
  # GET /lists.json
  def index
    @lists = List.all
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  #def edit
  #end

  #POST /nextList
  def getnextlist
    user = User.find_by username:params[:username]
    userId = user.id
    previousListId = lastListId(userId)
    listId = nextListId(previousListId)
    testcase = Testcase.create user_id:userId, list_id:listId, training: false, finished: false, testpath: params[:testpath]
    testcaseToJson(testcase)
  end

  #POST /trainingList
  def getTrainingList
    user = User.find_by username:params[:username]
    list = List.find_by training:true
    testcase = Testcase.new user_id:user.id, list_id:list.id, training: true, finished: false, testpath: params[:testpath]
    testcase.save
    testcaseToJson(testcase)
  end

  # POST /lists
  # POST /lists.json
  def create

    require 'csv'
    csvfile = params[:file]
    @list = List.new(training: false, active: true,filename: csvfile.original_filename)
    if list_params[:training]==1 then @list.training=true end

    last = -1
    position = 0
    cvsArray = CSV.read(csvfile.path)
    cvsArray.drop(1).each do |row|
      unless row[0] == last
        last = row[0]
        position += 1
        @numberset = Numberset.new list: @list, position: position, length: row[0], order: row[5]
        @numberset.save()
      end
      number=Number.new numberset: @numberset, text: row[1], position: row[2]
      number.save
    end

    respond_to do |format|
       format.html { redirect_to @list, notice: 'List was successfully created.' }
       format.json { render action: 'show', status: :created, location: @list }
    end

  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|

       if @list.update(list_params_update)
         format.html { redirect_to @list, notice: 'List was successfully updated.' }
         format.json { head :no_content }
       else
         format.html { render action: 'edit' }
         format.json { render json: @list.errors, status: :unprocessable_entity }
       end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.permit(:filename, :training, :active)
    end

    def list_params_update
      params.require(:list).permit(:filename, :training, :active)
    end

    def testcaseToJson(testcase)
      render json: testcase.to_json(:only => :id,
                                    :include => {:list => {:only => [:id, :training],
                                                           :include => {:numbersets => {
                                                               :only => [:position, :order],
                                                               :include => {:numbers => {
                                                                   :only => [:position, :text]
                                                               }}
                                                           }}
                                    }}
      )
    end

    def lastListId(userId)
      lastCases = Testcase.where(user_id: userId, training: false)
      lastCase = lastCases.last
      if (lastCase.nil?)
        max=0
      else
        max = lastCase.list_id
      end
      max
    end

    def nextListId(lastListId)
      # lists = List.where("id > " + lastListId.to_s).where training: false, active: true
      # if lists.length == 0
      #   lists = List.where training: false, active: true
      # end
      # list = lists.first
      min = 9999999999
      ret = 9999999999

      lists = List.where training: false, active: true
      for list in lists do
        if list.id > lastListId and list.id < ret
           ret = list.id
        end
        if list.id < min
          min = list.id
        end
      end
      if ret == 9999999999
        ret = min
      end

      ret
    end

end
