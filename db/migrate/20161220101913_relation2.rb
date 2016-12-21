class Relation2 < ActiveRecord::Migration
  def change
  	 change_table(:borrowed_books) do |t|
      t.belongs_to :users, index: true
      t.belongs_to :books, index: true

  		end
  end
end
