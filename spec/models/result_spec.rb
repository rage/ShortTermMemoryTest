require 'spec_helper'

describe Result do

  it "can be saved" do
    data={keypressed:2, keypressindex:3, last_series:4, testcase_id:1, timestamp:122334223}
    result = Result.create data
    expect(result.keypressed).to eq(2)
    expect(result.keypressindex).to eq(3)
    expect(result.last_series).to eq(4)
    expect(result.testcase_id).to eq(1)
    expect(result.timestamp).to eq(122334223)
  end

end
