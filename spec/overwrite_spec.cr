require "./spec_helper"

Spectator.describe Cryscord::Overwrite do
  subject do
    described_class.new(
      Faker::Number.number(8).to_i,
      Cryscord::Overwrite::Type::Role,
      Cryscord::Permission::VIEW_CHANNEL | Cryscord::Permission::SEND_MESSAGES,
      Cryscord::Permission::EMBED_LINKS | Cryscord::Permission::ATTACH_FILES
    )
  end

  it "should have a unique id" do
    expect(subject.id).to be_a(Int32)
  end

  it "should have a type" do
    expect(subject.type).to eq(Cryscord::Overwrite::Type::Role)
  end

  it "should have a allow permission" do
    expect(subject.allow).to eq(Cryscord::Permission::VIEW_CHANNEL | Cryscord::Permission::SEND_MESSAGES)
  end

  it "should have a deny permission" do
    expect(subject.deny).to eq(Cryscord::Permission::EMBED_LINKS | Cryscord::Permission::ATTACH_FILES)
  end
end
