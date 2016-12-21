FactoryGirl.define do
  factory :borrowed_book do
    userId 1
    bookId 1
    borrowDate "2016-12-20"
    dueDate "2016-12-20"
    returnDate "2016-12-20"
  end
end
