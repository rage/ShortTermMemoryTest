require 'spec_helper'

describe TestcasesController do
  describe "finish" do

    before :each do
      user = FactoryGirl.create(:user)
      list = FactoryGirl.create(:list)
    end


    it "POST request to /finish with id of existing testcase returns true" do
      testcase =  FactoryGirl.create(:trainingNotFinished)
      params = {
          id: testcase.id,
      }
      post :finish, params
      expect(response.body).to eq "true"
    end

    it "POST request to /finish with id of existing testcase changes finished to true" do
      testcase =  FactoryGirl.create(:trainingNotFinished)
      params = {
          id: testcase.id,
      }
      expect(Testcase.find_by(id:testcase.id).finished).to eq(false)
      post :finish, params
      expect(Testcase.find_by(id:testcase.id).finished).to eq(true)
    end

    it "POST request to /finish with id of finished testcase returns true" do
      testcase =  FactoryGirl.create(:trainingFinished)
      params = {
          id: testcase.id,
      }
      post :finish, params
      expect(response.body).to eq "true"
    end

    it "POST request to /finish with id of finished testcase doesn't change finished-field" do
      testcase =  FactoryGirl.create(:trainingFinished)
      params = {
          id: testcase.id,
      }
      expect(Testcase.find_by(id:testcase.id).finished).to eq(true)
      post :finish, params
      expect(Testcase.find_by(id:testcase.id).finished).to eq(true)
    end

    it "POST request to /finish with id of non-existing testcase returns false" do
      params = {
          id: 994535,
      }
      post :finish, params
      expect(response.body).to eq "false"
    end

  end

end
