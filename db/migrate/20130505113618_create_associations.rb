class CreateAssociations < ActiveRecord::Migration
  def up
  	add_column :templates, :campaign_id, :integer
  	add_column :receipients, :campaign_id, :integer
  	add_column :emails, :receipient_id, :integer
  end

  def down
	remove_column :templates, :campaign_id
	remove_column :receipients, :campaign_id
	remove_column :emails, :receipient_id
  end
end
