class CreateBorrowedBooks < ActiveRecord::Migration
  def change
    drop_table :borrowed_books
    create_table :borrowed_books do |t|
      t.integer :userId
      t.integer :bookId
      t.date :borrowDate
      t.date :dueDate
      t.date :returnDate

      t.timestamps null: false
    end
  end
end
