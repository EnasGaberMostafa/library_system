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

  describe "Testing max and min size of input" do
    context "Title shouldn't be more than 100 char" do
      before { @book.title = "title" * 100}
      it { should_not be_valid }
    end

    context "Author shouldn't be more than 100 char" do
      before { @book.author = "author" * 100}
      it { should_not be_valid }
    end

    context "Title shouldn't be leass than 3 char" do
      before { @book.title = "ti"}
      it { should_not be_valid }
    end

    context "Author shouldn't be more than 3 char" do
      before { @book.author = "au"}
      it { should_not be_valid }
    end

    context "Book code size should be equal to 11" do
      before { @book.BookCode = "aaaaaaaaaaa"}
      it { should be_valid }
    end

    context "Book code size shouldn't be less to 11" do
      before { @book.BookCode = "aaaaaaa"}
      it { should_not be_valid }
    end
  end

  describe "Testing number of copies" do
    context "Number of copies should be numberical" do
      before { @book.numOfCopies = "title"}
      it { should_not be_valid }
    end

    context "Number of copies should be integer" do
      before { @book.numOfCopies = 100.0}
      it { should_not be_valid }
    end

    context "Number of copies should be more than one" do
      before { @book.numOfCopies = 0}
      it { should_not be_valid }
    end

    context "Number of copies can be 1..oo" do
      before { @book.numOfCopies = 1000}
      it { should be_valid }
    end
  end

  describe "Testing image extension" do
    context "Image extension can be gif" do
      before { @book.image = "image.gif"}
      it { should be_valid }
    end
    context "Image extension can be jpg" do
      before { @book.image = "image.jpg"}
      it { should be_valid }
    end
    context "Image extension can be png" do
      before { @book.image = "image.png"}
      it { should be_valid }
    end
  end
end