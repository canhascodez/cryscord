require "./spec_helper"

Spectator.describe Cryscord::Snowflake do
  subject { Cryscord::Snowflake.new(175928847299117063) }
  describe "#timestamp" do
    it "returns the timestamp" do
      expect(subject.timestamp).to eq(1462015105796)
    end
  end
  describe "#worker_id" do
    it "returns the worker id" do
      expect(subject.worker_id).to eq(1)
    end
  end
  describe "#process_id" do
    it "returns the process id" do
      expect(subject.process_id).to eq(0)
    end
  end
  describe "#increment" do
    it "returns the increment" do
      expect(subject.increment).to eq(7)
    end
  end
end
