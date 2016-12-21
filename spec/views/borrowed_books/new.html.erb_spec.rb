require 'rails_helper'

RSpec.describe "borrowed_books/new", type: :view do
  before(:each) do
    assign(:borrowed_book, BorrowedBook.new(
      :userId => 1,
      :bookId => 1
    ))
  end

  it "renders new borrowed_book form" do
    render

    assert_select "form[action=?][method=?]", borrowed_books_path, "post" do

      assert_select "input#borrowed_book_userId[name=?]", "borrowed_book[userId]"

      assert_select "input#borrowed_book_bookId[name=?]", "borrowed_book[bookId]"
    end
  end
end
