require 'spec_helper'

describe TestlogsController do

  it "can create testlog" do
    testJSON = {testlog: [{testcase_id:1, eventtype:"dgffdsfdg", value:4, timestamp:"122334223"}]}
    t = {"testlog" => { "0" => {"testcase_id"=>"1","eventtype"=>"EVENT_PRACTICE_GAME_START", "value"=>"ThisGame", "timestamp"=>"1402058326676"}}}

    post :create, t
    #byebug
    expect(response.body).to include("ok")
  end

  it "can't create testlog with invalid information" do
    testJSON = {testlog: [{testcase:1, eventtype:"dgffdsfdg", value:1, timestamp:"122334223"},
                          {testcase:1, eventtype:"dgffdsfdg", value:2, timestamp:"122334224"},
                          {testcase:2, eventtype:"", value:3, timestamp:"122334226"}]}
    t = {"testlog" => { "0" => {"eventtype"=>"EVENT_PRACTICE_GAME_START", "value"=>"ThisGame", "timestamp"=>"1402058326676"}}}
    tt = {"testlog"=>{"0"=>{"eventtype"=>"", "value"=>"ThisGame", "timestamp"=>"1402058563490"}, "1"=>{"eventtype"=>"EVENT_SHOWLIST_START", "value"=>"", "timestamp"=>"1402058563490"}, "2"=>{"eventtype"=>"EVENT_SHOWSERIES_START", "value"=>"", "timestamp"=>"1402058563490"}, "3"=>{"eventtype"=>"EVENT_TYPE_KEYUP", "value"=>"32", "timestamp"=>"1402058563625"}}}
    post :create, tt
    #byebug
    expect(response.body).to include("error")
  end
  #t = {"testlog" => { "0" => {"eventtype"=>"EVENT_PRACTICE_GAME_START", "value"=>"ThisGame", "timestamp"=>"1402058326676"}}}
  #tt = {"testlog"=>{"0"=>{"eventtype"=>"EVENT_PRACTICE_GAME_START", "value"=>"ThisGame", "timestamp"=>"1402058563490"}, "1"=>{"eventtype"=>"EVENT_SHOWLIST_START", "value"=>"", "timestamp"=>"1402058563490"}, "2"=>{"eventtype"=>"EVENT_SHOWSERIES_START", "value"=>"", "timestamp"=>"1402058563490"}, "3"=>{"eventtype"=>"EVENT_TYPE_KEYUP", "value"=>"32", "timestamp"=>"1402058563625"}}}

  it "user can see test data in database" do
    testJSON = {testlog: [{testcase_id:1, eventtype:"dgffdsfdg", value:4, timestamp:"122334223"}]}
    t = {"testlog" => { "0" => {"testcase_id"=>"1","eventtype"=>"EVENT_PRACTICE_GAME_START", "value"=>"ThisGame", "timestamp"=>"1402058326676"}}}

    post :create, t

    @testlog = Testlog.find_by testcase_id:(1)
    expect(@testlog.eventtype).to eq "EVENT_PRACTICE_GAME_START"


  end
end