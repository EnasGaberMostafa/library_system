require 'rails_helper'

RSpec.describe BorrowedBook, type: :model do
	describe Book do
  before { @borrowed_book = FactoryGirl.build(:borrowed_book) }
  subject { @borrowed_book }

  ##Test validation
  describe "Testing Presence validations" do
    context "dueDate should not be blank" do
      before { @borrowed_book.dueDate = ""}
      it { should_not be_valid }
    end

    context "Author should not be blank" do
      before { @borrowed_book.borrowDate = ""}
      it { should_not be_valid }
    end
  end


    ##Test validation

  describe "Testing date validations" do
    context "dueDate err " do
      before { @borrowed_book.dueDate = "2016-12-22"}
      it { should_not be_valid }
    end

    context "borrowDate tru" do
      before { @borrowed_book.borrowDate = "2016-12-21"}
      it { should_not be_valid }
    end

       context "dueDate true " do
      before { @borrowed_book.dueDate = "2016-12-21"}
      it { should_not be_valid }
    end

    context "borrow err " do
      before { @borrowed_book.borrowDate = "2016-12-22"}
      it { should_not be_valid }
    end

         context "dueDate err2 " do
      before { @borrowed_book.dueDate = "2016-12-19"}
      it { should_not be_valid }
    end

    context " borrow date err2" do
      before { @borrowed_book.borrowDate = "2016-12-20"}
      it { should_not be_valid }
    end

  end


end
end