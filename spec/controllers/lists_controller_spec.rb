require 'spec_helper'

describe ListsController do

    before :each do
      list1 = FactoryGirl.create(:list)
      list2 = FactoryGirl.create(:list2)
    end

  it "First time user gets the first list" do
    user = FactoryGirl.create(:user)
    params = {
        username: user.username,
    }
    post :getnextlist, params
    expect(response.body).to include "{\"id\":1,\"list\":{\"id\":1"
  end

  it "Second time user gets the second list" do

    user = FactoryGirl.create(:user)
    params = {
        username: user.username,
    }
    post :getnextlist, params
    post :getnextlist, params
    expect(response.body).to include  "{\"id\":2,\"list\":{\"id\":2"
  end

  it "Third time user gets the first list if two lists saved" do

    user = FactoryGirl.create(:user)
    params = {
        username: user.username,
    }
    post :getnextlist, params
    post :getnextlist, params
    post :getnextlist, params
    expect(response.body).to include  "{\"id\":3,\"list\":{\"id\":1"
  end

  it "Two users get the same list first" do

    user1 = FactoryGirl.create(:user)
    params1 = {
        username: user1.username,
    }
    user2 = FactoryGirl.create(:user2)
    params2 = {
        username: user2.username,
    }
    post :getnextlist, params1
    expect(response.body).to include  "{\"id\":1,\"list\":{\"id\":1"
    post :getnextlist, params2
    expect(response.body).to include  "{\"id\":2,\"list\":{\"id\":1"
  end

  it "training list is skipped" do
    list = FactoryGirl.create(:trainingList)
    list = FactoryGirl.create(:list3)

    user = FactoryGirl.create(:user)
    params = {
        username: user.username,
    }
    post :getnextlist, params
    expect(response.body).to include  "{\"id\":1,\"list\":{\"id\":1"
    post :getnextlist, params
    expect(response.body).to include  "{\"id\":2,\"list\":{\"id\":2"
    post :getnextlist, params
    expect(response.body).to include  "{\"id\":3,\"list\":{\"id\":4"
    post :getnextlist, params
    expect(response.body).to include  "{\"id\":4,\"list\":{\"id\":1"
  end

  it "inactive list is skipped" do
    list = FactoryGirl.create(:inactiveList)
    list = FactoryGirl.create(:list3)

    user = FactoryGirl.create(:user)
    params = {
        username: user.username,
    }
    post :getnextlist, params
    expect(response.body).to include  "{\"id\":1,\"list\":{\"id\":1"
    post :getnextlist, params
    expect(response.body).to include  "{\"id\":2,\"list\":{\"id\":2"
    post :getnextlist, params
    expect(response.body).to include  "{\"id\":3,\"list\":{\"id\":4"
    post :getnextlist, params
    expect(response.body).to include "{\"id\":4,\"list\":{\"id\":1"
  end

  it "GET traininglists returns training list" do
    list = FactoryGirl.create(:trainingList)
    list = FactoryGirl.create(:list3)

    user = FactoryGirl.create(:user)
    params = {
        username: user.username,
    }
    post :getTrainingList, params
    expect(response.body).to include  "{\"id\":1,\"list\":{\"id\":3"
  end


  it "after training the first list is given" do
    list = FactoryGirl.create(:trainingList)
    list = FactoryGirl.create(:list3)

    user = FactoryGirl.create(:user)
    params = {
        username: user.username,
    }
    post :getTrainingList, params
    expect(response.body).to include  "{\"id\":1,\"list\":{\"id\":3"
    post :getnextlist, params
    expect(response.body).to include "{\"id\":2,\"list\":{\"id\":1"
  end

    it "response OK when list is successfully deactivated" do
      params = {
          :active=> 0
      }
      put :update, :id=> 1, :list => params
      correct_path = lists_path + "/1"
      response.should redirect_to correct_path
    end


    it "deactivated list is skipped" do
      user = FactoryGirl.create(:user)
      params = {
          :active=> 0
      }
      put :update, :id=> 1, :list => params
      params = {
          username: user.username,
      }
      post :getnextlist, params
      expect(response.body).to include "{\"id\":1,\"list\":{\"id\":2"
    end


end
