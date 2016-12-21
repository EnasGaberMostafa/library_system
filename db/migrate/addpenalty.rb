class AddPenalty < ActiveRecord::Migration
  add_column :users, :penalty,:integer, :default => 0
end