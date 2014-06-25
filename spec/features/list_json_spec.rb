require 'capybara/rspec'
require 'spec_helper'

describe "Lists" do

  it "if csv-file is uploaded and saved to database, lists/1.json includes numbersets and numbers of the list" do
    FactoryGirl.create(:admin)
    visit rails_admin_path
    fill_in('admin_email',with:'hello@world.com')
    fill_in('admin_password',with:'Tsoha123')
    click_button('Sign in')

    visit new_list_path
    attach_file "file", "spec/fixtures/lista_esimerkkikorjattu.csv"
    click_button "Create list"
    visit  lists_path+"/1.json"

    expect(page).to have_content "[{\"id\":1,\"order\":\"backwards\",\"list_id\":1,\"numbers\":[{\"position\":1,\"text\":5},{\"position\":2,\"text\":7},{\"position\":3,\"text\":3},{\"position\":4,\"text\":8}]},{\"id\":2,\"order\":\"upwards\",\"list_id\":1,\"numbers\":[{\"position\":1,\"text\":4},{\"position\":2,\"text\":7},{\"position\":3,\"text\":1}]}"
  end
end