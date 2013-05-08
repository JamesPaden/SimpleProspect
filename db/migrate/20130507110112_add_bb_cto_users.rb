class AddBbCtoUsers < ActiveRecord::Migration
  def up
  	add_column :users, :bbc, :string
  end

  def down
  	remove_columns :users, :bbc
  end
end
