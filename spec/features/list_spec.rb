require 'capybara/rspec'
require 'spec_helper'
describe "Lists" do



  it "if csv file is uploaded, page should response success" do

    visit new_list_path
    attach_file "file", "spec/fixtures/lista_esimerkkikorjattu.csv"
    click_button "Create list"

    expect(page).to have_content "List was successfully created"
    expect(page).to have_content "Filename: lista_esimerkkikorjattu.csv"

  end


  it "if csv file is uploaded, Numberset data found database" do

    visit new_list_path
    attach_file "file", "spec/fixtures/lista_esimerkkikorjattu.csv"
    click_button "Create list"
    numset = Numberset.all
    #byebug

    x = numset.find_by id:1
    x.length.should == 4
    x.list_id.should == 1
    x.position.should == 1

    x = numset.find_by id:4
    x.length.should == 7
    x.list_id.should == 1
    x.position.should == 4
  end

  it "if csv file is uploaded, numbers data found database" do

    visit new_list_path
    attach_file "file", "spec/fixtures/lista_esimerkkikorjattu.csv"
    click_button "Create list"
    numbers = Numbers.all
    #byebug

    x = numbers.find_by numberset_id:1

    x.position.should == 1
  end

end