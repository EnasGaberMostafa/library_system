require 'rails_helper'

RSpec.describe "borrowed_books/show", type: :view do
  before(:each) do
    @borrowed_book = assign(:borrowed_book, BorrowedBook.create!(
      :userId => 1,
      :bookId => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
