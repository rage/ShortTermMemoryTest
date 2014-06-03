require 'capybara/rspec'
require 'spec_helper'
describe "Lists" do


  before :each do

    list = FactoryGirl.create(:list)
    list = FactoryGirl.create(:list2)

  end



  it "First time user gets the first list" do
    user = FactoryGirl.create(:user)
    params = {
        username: user.username,
    }
    visit nextList_path params
    expect(page).to have_content "{\"id\":1,\"list\":{\"id\":1"
  end

  it "Second time user gets the second list" do

    user = FactoryGirl.create(:user)
    params = {
        username: user.username,
    }
    visit nextList_path params
    visit nextList_path params
    expect(page).to have_content "{\"id\":2,\"list\":{\"id\":2"
  end

  it "Third time user gets the first list if two lists saved" do

    user = FactoryGirl.create(:user)
    params = {
        username: user.username,
    }
    visit nextList_path params
    visit nextList_path params
    visit nextList_path params
    expect(page).to have_content "{\"id\":3,\"list\":{\"id\":1"
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
    visit nextList_path params1
    expect(page).to have_content "{\"id\":1,\"list\":{\"id\":1"
    visit nextList_path params2
    expect(page).to have_content "{\"id\":2,\"list\":{\"id\":1"
  end

  it "training list is skipped" do
    list = FactoryGirl.create(:trainingList)
    list = FactoryGirl.create(:list3)

    user = FactoryGirl.create(:user)
    params = {
        username: user.username,
    }
    visit nextList_path params
    expect(page).to have_content "{\"id\":1,\"list\":{\"id\":1"
    visit nextList_path params
    expect(page).to have_content "{\"id\":2,\"list\":{\"id\":2"
    visit nextList_path params
    expect(page).to have_content "{\"id\":3,\"list\":{\"id\":4"
    visit nextList_path params
    expect(page).to have_content "{\"id\":4,\"list\":{\"id\":1"
  end

  it "inactive list is skipped" do
    list = FactoryGirl.create(:inactiveList)
    list = FactoryGirl.create(:list3)

    user = FactoryGirl.create(:user)
    params = {
        username: user.username,
    }
    visit nextList_path params
    expect(page).to have_content "{\"id\":1,\"list\":{\"id\":1"
    visit nextList_path params
    expect(page).to have_content "{\"id\":2,\"list\":{\"id\":2"
    visit nextList_path params
    expect(page).to have_content "{\"id\":3,\"list\":{\"id\":4"
    visit nextList_path params
    expect(page).to have_content "{\"id\":4,\"list\":{\"id\":1"
  end



end