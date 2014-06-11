require 'spec_helper'

=begin
describe 'Download result csv' do
  include AuthHelper
  before(:each) do
    http_login
  end
  let!(:user){ FactoryGirl.create(:user) }
  let!(:list){ FactoryGirl.create(:list) }
  let!(:testcase){ FactoryGirl.create(:testcase) }
  let!(:testlog){ FactoryGirl.create(:testlog) }

  it "can be done" do
    #request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("foo:bar")
    #basic_authorize 'foo','bar'
    get 'http://localhost:3000/admin', {}, @env
    #visit rails_admin_path, @env #"-u 'foo:bar' " #'http://localhost:3000/admin -u "foo:bar"'

    save_and_open_page
  end
end=end
