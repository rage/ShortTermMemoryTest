require 'spec_helper'

describe UsersController do
  describe "login" do

    it "If user is not registered, the response is correct" do

      params = {
          username: "vieras",
      }
      post :login, params
      expect(response.body).to eq "{\"isReserved\":false, \"isTrained\": false}"
    end

    it "If user is registered but not trained, the response is correct" do
      user = FactoryGirl.create(:user)
      params = {
          username: user.username,
      }
      post :login, params
      expect(response.body).to eq "{\"isReserved\":true, \"isTrained\": false}"
    end

    it "If user is registered and training started but not finished, the response is correct" do
      user = FactoryGirl.create(:user)
      training = FactoryGirl.create(:trainingNotFinished)
      params = {
          username: user.username,
      }
      post :login, params
      expect(response.body).to eq "{\"isReserved\":true, \"isTrained\": false}"
    end

    it "If user is registered and training done, the response is correct" do
      user = FactoryGirl.create(:user)
      training = FactoryGirl.create(:trainingFinished)
      params = {
          username: user.username,
      }
      post :login, params
      expect(response.body).to eq "{\"isReserved\":true, \"isTrained\": true}"
    end
  end



  describe "create" do

    it "If all the parameters are correct (left-handed female), user is created" do
      params = {
          username: "newName",
          sex: "f",
          handedness: "l",
          yearOfBirth: 1901,
          education: "yo",
      }
      post :create, params
      expect(response.body).to eq "true"
      post :login, params
      expect(response.body).to eq "{\"isReserved\":true, \"isTrained\": false}"
    end

    it "If all the parameters are correct (right-handed male), user is created" do
      params = {
          username: "newName",
          sex: "m",
          handedness: "r",
          yearOfBirth: 1901,
          education: "yo",
      }
      post :create, params
      expect(response.body).to eq "true"
      post :login, params
      expect(response.body).to eq "{\"isReserved\":true, \"isTrained\": false}"
    end

    it "If sex-parameter is 'o', user is not created" do
      params = {
          username: "newName",
          sex: "o",
          handedness: "l",
          yearOfBirth: 1901,
          education: "yo",
      }
      post :create, params
      expect(response.body).to eq "false"
      post :login, params
      expect(response.body).to eq "{\"isReserved\":false, \"isTrained\": false}"
    end

    it "If handedness-parameter is 'o', user is not created" do
      params = {
          username: "newName",
          sex: "f",
          handedness: "o",
          yearOfBirth: 1901,
          education: "yo",
      }
      post :create, params
      expect(response.body).to eq "false"
      post :login, params
      expect(response.body).to eq "{\"isReserved\":false, \"isTrained\": false}"
    end

    it "If yearOfBirth-parameter is not a number, user is not created" do
      params = {
          username: "newName",
          sex: "f",
          handedness: "l",
          yearOfBirth: "vuosi kahdeksanviis",
          education: "yo",
      }
      post :create, params
      expect(response.body).to eq "false"
      post :login, params
      expect(response.body).to eq "{\"isReserved\":false, \"isTrained\": false}"
    end

    it "If yearOfBirth-parameter is in future, user is not created" do
      params = {
          username: "newName",
          sex: "f",
          handedness: "l",
          yearOfBirth: Time.now.year+1,
          education: "yo",
      }
      post :create, params
      expect(response.body).to eq "false"
      post :login, params
      expect(response.body).to eq "{\"isReserved\":false, \"isTrained\": false}"
    end

    it "If yearOfBirth-parameter is 1899, user is not created" do
      params = {
          username: "newName",
          sex: "f",
          handedness: "l",
          yearOfBirth: 1899,
          education: "yo",
      }
      post :create, params
      expect(response.body).to eq "false"
      post :login, params
      expect(response.body).to eq "{\"isReserved\":false, \"isTrained\": false}"
    end

  end



end
