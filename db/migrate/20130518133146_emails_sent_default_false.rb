class EmailsSentDefaultFalse < ActiveRecord::Migration
  def up
  	change_column :emails, :sent, :boolean, :default => false
  end

  def down
  end
end
