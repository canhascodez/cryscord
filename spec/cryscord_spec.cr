require "./spec_helper"

describe Cryscord do

  it "has a version number" do
    Cryscord::VERSION.should_not be_nil
  end

  it "has a discord API version" do
    Cryscord::API_VERSION.should_not be_nil
  end
end
