class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :BookCode
      t.string :author
      t.integer :numOfCopies
      t.integer :popularity
      t.string :image

      t.timestamps null: false
    end
  end
end
