class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.integer :val
      t.references :book, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
