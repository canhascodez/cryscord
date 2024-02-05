require "../spec_helper"

record(NonDeprecatedClass, bar : String)
record(DeprecatedClass, bar : String) do
  Cryscord::Deprecation.deprecated_field("bar", "10", "11", "10")
end
record(RemovedClass, bar : String) do
  Cryscord::Deprecation.deprecated_field("bar", "10", "11", "12")
end
Spectator.describe Cryscord::Deprecation do
  context "below triggering version" do
    it "does not raise" do
      expect(NonDeprecatedClass.new("bar").bar).to eq("bar")
    end
  end

  context "when method is deprecated" do
    let(output) { Log::MemoryBackend.new }
    before do
      ::Log.setup(Log::Severity::Warn, output)
    end
    it "logs a warning" do
      DeprecatedClass.new("bar").bar
      expected = "The field `bar` has been deprecated in Discord API version 10"
      expect(output.entries.first.message).to eq(expected)
    end
  end

  context "when method is removed" do
    it "raises an error" do
      message = "The field `bar` has been removed in Discord API version 11"
      expect { RemovedClass.new("bar").bar }.to raise_error(Cryscord::Deprecation::DeprecationError, message)
    end
  end
end
