require 'spec_helper'

describe Testlog do

  it "can be saved" do
    data={testcase_id:1, eventtype:"dgffdsfdg", value:4, timestamp:122334223}
    testlog = Testlog.create data
    expect(testlog.eventtype).to eq("dgffdsfdg")
    expect(testlog.value).to eq(4)
    expect(testlog.testcase_id).to eq(1)
    expect(testlog.timestamp).to eq(122334223)
  end

end