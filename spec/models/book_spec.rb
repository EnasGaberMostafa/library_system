require 'spec_helper'

describe Book do
  before { @book = FactoryGirl.build(:book) }
  subject { @book }

  ##Test columns
  it { should respond_to(:title) }
  it { should respond_to(:author) }
  it { should respond_to(:BookCode) }
  it { should respond_to(:numOfCopies) }
  it { should respond_to(:popularity) }
  it { should respond_to(:image) }


  ##Test validation
  describe "Testing Presence validations" do
    context "Title should not be blank" do
      before { @book.title = ""}
      it { should_not be_valid }
    end

    context "Author should not be blank" do
      before { @book.author = ""}
      it { should_not be_valid }
    end

    context "Book code should not be blank" do
      before { @book.BookCode = ""}
      it { should_not be_valid }
    end

    context "Book code should not be blank" do
      before { @book.numOfCopies = nil}
      it { should_not be_valid }
    end
  end




end