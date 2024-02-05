require "./spec_helper"

Spectator.describe Cryscord do

  it "has a version number" do
    expect(Cryscord::VERSION).not_to be_nil
  end

  it "has a discord API version" do
    expect(Cryscord::API_VERSION).not_to be_nil
  end
end
