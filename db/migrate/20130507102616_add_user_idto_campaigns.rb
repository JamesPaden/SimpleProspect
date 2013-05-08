class AddUserIdtoCampaigns < ActiveRecord::Migration
  def up
  	add_column :campaigns, :user_id, :integer
  end

  def down
  	remove_column :campaigns, :user_id
  end
end
