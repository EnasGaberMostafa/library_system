require 'rails_helper'

RSpec.describe Rate, type: :model do
  before { @rate = FactoryGirl.build(:rate) }
  subject { @rate }

  describe "Testing Presence validations" do
    context "val should not be blank" do
      before { @rate.val = nil}
      it { should_not be_valid }
    end

    context "User id should not be blank" do
      before { @rate.user_id = nil}
      it { should_not be_valid }
    end

    context "Book id should not be blank" do
      before { @rate.book_id = nil}
      it { should_not be_valid }
    end
  end

  describe "Testing rate" do
    context "rate value should be numberical" do
      before { @rate.val = "title"}
      it { should_not be_valid }
    end

    context "rate should be integer" do
      before { @rate.val = 100.0}
      it { should_not be_valid }
    end
  end
end
