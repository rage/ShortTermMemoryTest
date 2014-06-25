require 'spec_helper'

describe TestlogsController do

  it "can create testlog" do
    t = {"testlog" => { "0" => {"testcase_id"=>"1","eventtype"=>"EVENT_PRACTICE_GAME_START", "value"=>"ThisGame", "timestamp"=>"1402058326676"}}}
    post :create, t
    expect(response.body).to include("ok")
  end

  it "can't create testlog with invalid information" do
    tt = {"testlog"=>{"0"=>{"eventtype"=>"", "value"=>"ThisGame", "timestamp"=>"1402058563490"},
                      "1"=>{"eventtype"=>"EVENT_SHOWLIST_START", "value"=>"", "timestamp"=>"1402058563490"},
                      "2"=>{"eventtype"=>"EVENT_SHOWSERIES_START", "value"=>"", "timestamp"=>"1402058563490"},
                      "3"=>{"eventtype"=>"EVENT_TYPE_KEYUP", "value"=>"32", "timestamp"=>"1402058563625"}}}
    post :create, tt
    expect(response.body).to include("error")
  end

  it "user can see test data in database" do
    t = {"testlog" => { "0" => {"testcase_id"=>"1","eventtype"=>"EVENT_PRACTICE_GAME_START", "value"=>"ThisGame", "timestamp"=>"1402058326676"}}}
    post :create, t
    @testlog = Testlog.find_by testcase_id:(1)
    expect(@testlog.eventtype).to eq "EVENT_PRACTICE_GAME_START"
  end
  #testJSON = {testlog: [{testcase_id:1, eventtype:"dgffdsfdg", value:4, timestamp:"122334223"}]}
end