FactoryGirl.define do
  factory :borrowed_book do
    userId 16
    bookId 9
    borrowDate "2016-12-21"
    dueDate "2016-12-21"
    returnDate ""
  end
end
