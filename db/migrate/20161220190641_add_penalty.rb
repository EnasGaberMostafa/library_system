class AddPenalty < ActiveRecord::Migration
  def change
  add_column :users, :penalty,:integer, :default => 0

  end
end
