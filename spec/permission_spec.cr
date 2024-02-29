require "./spec_helper"

Spectator.describe Cryscord::Permission do
  subject { Cryscord::Permission.new("123") }
  describe ".new" do
    it "converts the string representation to UInt64" do
      expect(subject.value).to eq(123_u64)
    end
  end

  describe "#needs_oauth?" do
    subject { Cryscord::Permission.new("2") }
    it "requires oauth to kick a member" do
      expect(subject.needs_oauth?).to be_truthy
    end
  end
end
