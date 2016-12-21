require 'rails_helper'

RSpec.describe Comment, type: :model do
  before { @comment = FactoryGirl.build(:comment) }
  subject { @comment }

  describe "Testing Presence validations" do
    context "Body should not be blank" do
      before { @comment.body = ""}
      it { should_not be_valid }
    end

    context "User id should not be blank" do
      before { @comment.user_id = nil}
      it { should_not be_valid }
    end

    context "Book id should not be blank" do
      before { @comment.book_id = nil}
      it { should_not be_valid }
    end
  end


end
