require 'spec_helper'

describe ResultsController do

  it "responds with ok when posted correct data" do

    t = {"result" => { "0" => { "keypressed"=>"3", "keypressindex"=>"1", "last_series"=>"3", "timestamp"=>"122334223", "testcase_id"=>"1" }}}
    post :create, t
    expect(response.body).to include("ok")

  end

  it "responds with a error when posted incorrect data" do

    testcadeIdMissing = {"result" => { "0" => { "keypressed"=>"3", "keypressindex"=>"1", "last_series"=>"3", "timestamp"=>"122334223" }}}
    post :create, testcadeIdMissing
    expect(response.body).to include("error")

  end
end
