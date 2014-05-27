require 'spec_helper'

describe List do
  it "has the filename set correctly" do
    list = List.new filename:"taman_on_jokin_tiedoton_nimi"

    list.filename.should == "taman_on_jokin_tiedoton_nimi"
  end
end
