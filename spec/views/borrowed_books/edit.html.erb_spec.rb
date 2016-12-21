require 'rails_helper'

RSpec.describe "borrowed_books/edit", type: :view do
  before(:each) do
    @borrowed_book = assign(:borrowed_book, BorrowedBook.create!(
      :userId => 1,
      :bookId => 1
    ))
  end

  it "renders the edit borrowed_book form" do
    render

    assert_select "form[action=?][method=?]", borrowed_book_path(@borrowed_book), "post" do

      assert_select "input#borrowed_book_userId[name=?]", "borrowed_book[userId]"

      assert_select "input#borrowed_book_bookId[name=?]", "borrowed_book[bookId]"
    end
  end
end
