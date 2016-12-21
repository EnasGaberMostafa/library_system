require 'rails_helper'

RSpec.describe "BorrowedBooks", type: :request do
  describe "GET /borrowed_books" do
    it "works! (now write some real specs)" do
      get borrowed_books_path
      expect(response).to have_http_status(200)
    end
  end
end
