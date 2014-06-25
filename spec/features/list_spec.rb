require 'capybara/rspec'
require 'spec_helper'
describe "Lists" do


  before :each do

    FactoryGirl.create(:admin)
    visit rails_admin_path
    fill_in('admin_email',with:'hello@world.com')
    fill_in('admin_password',with:'Tsoha123')
    click_button('Sign in')

    visit new_list_path
    attach_file "file", "spec/fixtures/lista_esimerkkikorjattu.csv"
    click_button "Create list"

  end



  it "if csv file is uploaded, List is successfully created" do

    expect(page).to have_content "List was successfully created"
    expect(page).to have_content "Filename: lista_esimerkkikorjattu.csv"

  end


  it "if csv file is uploaded, Numberset data found database" do

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

    number = Number.all


    x = number.find_by id:1
    x.position.should == 1
    x.text.should == 5

    x = number.find_by id:2
    x.numberset_id.should == 1
    x.position.should == 2
    x.text.should == 7

    x = number.find_by id:3
    x.numberset_id.should == 1
    x.position.should == 3
    x.text.should == 3

    x = number.find_by id:5
    x.numberset_id.should == 2
    x.position.should == 1
    x.text.should == 4

    x = number.find_by id:40
    x.numberset_id.should == 10
    x.position.should == 4
    x.text.should == 9

    x = number.find_by id:49
    x.numberset_id.should == 12
    x.position.should == 2
    x.text.should == 6


  end
  it "if csv file is uploaded, list can remove" do


    number = Number.all
    x = number.find_by id:1
    x.position.should == 1
    x.text.should == 5
    number.length.should == 49

    visit lists_path
    click_link "Destroy"

    number = Number.all
    number.length.should == 0
  end

end