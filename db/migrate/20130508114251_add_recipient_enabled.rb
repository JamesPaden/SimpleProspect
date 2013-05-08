class AddRecipientEnabled < ActiveRecord::Migration
  def change
  	add_column :recipients, :enabled, :boolean, :default => true
  	remove_column :campaigns, :enabled
  end
end
