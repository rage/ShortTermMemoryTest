require 'spec_helper'

describe ListsController do

    before :each do
      @admin = FactoryGirl.create(:admin)
      @list1 = FactoryGirl.create(:list)
      @list2 = FactoryGirl.create(:list2)
      @user = FactoryGirl.create(:user)
      @params = {
          username: @user.username,
          testpath: "http://testitesti.com"
      }
    end

  it "First time user gets the first list" do
    post :getnextlist, @params
    expect(response.body).to include "{\"id\":1,\"list\":{\"id\":1"
  end

  it "Second time user gets the second list" do
    post :getnextlist, @params
    post :getnextlist, @params
    expect(response.body).to include  "{\"id\":2,\"list\":{\"id\":2"
  end

  it "Third time user gets the first list if two lists saved" do
    post :getnextlist, @params
    post :getnextlist, @params
    post :getnextlist, @params
    expect(response.body).to include  "{\"id\":3,\"list\":{\"id\":1"
  end

  it "Two users get the same list first" do

    user2 = FactoryGirl.create(:user2)
    params2 = {
        username: user2.username,
        testpath: "http://testitesti.com"
    }
    post :getnextlist, @params
    expect(response.body).to include  "{\"id\":1,\"list\":{\"id\":1"
    post :getnextlist, params2
    expect(response.body).to include  "{\"id\":2,\"list\":{\"id\":1"
  end

  it "training list is skipped" do
    list = FactoryGirl.create(:trainingList)
    list = FactoryGirl.create(:list3)

    post :getnextlist, @params
    expect(response.body).to include  "{\"id\":1,\"list\":{\"id\":1"
    post :getnextlist, @params
    expect(response.body).to include  "{\"id\":2,\"list\":{\"id\":2"
    post :getnextlist, @params
    expect(response.body).to include  "{\"id\":3,\"list\":{\"id\":4"
    post :getnextlist, @params
    expect(response.body).to include  "{\"id\":4,\"list\":{\"id\":1"
  end

  it "inactive list is skipped" do
    list = FactoryGirl.create(:inactiveList)
    list = FactoryGirl.create(:list3)

    post :getnextlist, @params
    expect(response.body).to include  "{\"id\":1,\"list\":{\"id\":1"
    post :getnextlist, @params
    expect(response.body).to include  "{\"id\":2,\"list\":{\"id\":2"
    post :getnextlist, @params
    expect(response.body).to include  "{\"id\":3,\"list\":{\"id\":4"
    post :getnextlist, @params
    expect(response.body).to include "{\"id\":4,\"list\":{\"id\":1"
  end

  it "GET traininglists returns training list" do
    trainingList = FactoryGirl.create(:trainingList)
    list3 = FactoryGirl.create(:list3)

    post :getTrainingList, @params
    expect(response.body).to include  "{\"id\":1,\"list\":{\"id\":3"
  end


  it "after training the first list is given" do
    list = FactoryGirl.create(:trainingList)
    list = FactoryGirl.create(:list3)

    post :getTrainingList, @params
    expect(response.body).to include  "{\"id\":1,\"list\":{\"id\":3"
    post :getnextlist, @params
    expect(response.body).to include "{\"id\":2,\"list\":{\"id\":1"
  end

    it "response OK when list is successfully deactivated" do
      params = {
          :active=> 0
      }
      sign_in :admin, @admin
      put :update, :id=> 1, :list => params
      correct_path = lists_path + "/1"
      response.should redirect_to correct_path
    end


    it "deactivated list is skipped" do
      params = {
          :active=> 0
      }
      sign_in :admin, @admin
      put :update, :id=> 1, :list => params
      post :getnextlist, @params
      expect(response.body).to include "{\"id\":1,\"list\":{\"id\":2"
    end

    it "getNextList creates a testcase correctly" do

      post :getnextlist, @params
      testcase = Testcase.first
      expect(testcase.testpath).to eq("http://testitesti.com")
      expect(testcase.user_id).to eq(@user.id)
      expect(testcase.list_id).to eq(@list1.id)
      expect(testcase.finished).to eq(false)
      expect(testcase.training).to eq(false)
    end

    it "getTrainingList creates a testcase correctly" do
      traininglist = FactoryGirl.create(:trainingList)

      post :getTrainingList, @params
      testcase = Testcase.first
      expect(testcase.testpath).to eq("http://testitesti.com")
      expect(testcase.user_id).to eq(@user.id)
      expect(testcase.list_id).to eq(traininglist.id)
      expect(testcase.finished).to eq(false)
      expect(testcase.training).to eq(true)
    end

end
