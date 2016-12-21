class CreateComments < ActiveRecord::Migration
  def change
  	drop_table :comments
    create_table :comments do |t|
      t.string :body
      t.references :user, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
