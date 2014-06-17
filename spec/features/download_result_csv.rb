require 'spec_helper'

describe 'Download result csv' do

  let!(:user){ FactoryGirl.create(:user) }
  let!(:list){ FactoryGirl.create(:list) }
  let!(:testcase){ FactoryGirl.create(:testcase) }
  let!(:testlog){ FactoryGirl.create(:testlog) }
  let!(:result){ FactoryGirl.create(:result) }
  let!(:admin){ FactoryGirl.create(:admin) }

  before(:each) do
    visit rails_admin_path
    fill_in('admin_email',with:'hello@world.com')
    fill_in('admin_password',with:'Tsoha123')
    click_button('Sign in')
  end

  it "can be done when there is one result" do

    #visit rails_admin_path
    visit "/admin/result"
    click_link "Export found Results"
    click_on "Export to csv"
    page.response_headers['Content-Type'].should eq "text/csv; charset=UTF-8; header=present"
    #save_and_open_page
  end

  it "can be done when there are several results" do
    FactoryGirl.create(:result)
    FactoryGirl.create(:result)
    FactoryGirl.create(:result)
    #visit rails_admin_path

    visit "/admin/result"
    click_link "Export found Results"
    click_on "Export to csv"
    page.response_headers['Content-Type'].should eq "text/csv; charset=UTF-8; header=present"
    #save_and_open_page
  end
end
