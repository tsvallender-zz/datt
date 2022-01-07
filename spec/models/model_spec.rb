require 'rails_helper'

RSpec.describe Note, :type => :model do
  context "with no title or content" do
    it "is invalid" do
      @user ||= FactoryBot.create :user
      note = @user.notes.build()
      expect(note).to be_invalid
    end
  end

  context "with title only" do
    it "to be valid" do
      @user ||= FactoryBot.create :user
      note = @user.notes.build(title: "Test")
      expect(note).to be_valid
    end
  end

  context "with content only" do
    it "to be valid" do
      @user ||= FactoryBot.create :user
      note = @user.notes.build(content: "Test")
      expect(note).to be_valid
    end
  end

  context "without user" do
    it "is invalid" do
      note = Note.new(title: "Test", content: "Test note")
      expect(note).to be_invalid
    end
  end
end