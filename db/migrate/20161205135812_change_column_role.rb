class ChangeColumnRole < ActiveRecord::Migration
  def change
  	rename_column :users, :role, :admin
  	change_column :users, :admin, :boolean
  end
end
