require 'spec_helper'

describe User do
  it "has the username set correctly" do
    user = User.new username:"Pekka"

    user.username.should == "Pekka"
  end
  it "has the gender set correctly" do
    user = User.new sex:"f"

    user.sex.should == "f"
  end
  it "has the yearOfBirth set correctly" do
    user = User.new yearOfBirth:Time.now.year

    user.yearOfBirth.should == Time.now.year
  end
  it "has the yearOfBirth set correctly" do
    user = User.new yearOfBirth:2000

    user.yearOfBirth.should == 2000
  end
  it "has the yearOfBirth set correctly" do
    user = User.new yearOfBirth:1900

    user.yearOfBirth.should == 1900
  end
  it "has the handedness set correctly" do
    user = User.new handedness:"r"

    user.handedness.should == "r"
  end
end
