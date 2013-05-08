class AddCamapignEnabled < ActiveRecord::Migration
  def change
  	add_column :campaigns, :enabled, :boolean, :default => true
  end
end
