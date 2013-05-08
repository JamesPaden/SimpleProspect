class FixEmailRecipientAssociation < ActiveRecord::Migration
  def up
  	remove_column :emails, :receipient_id
  	add_column :emails, :recipient_id, :integer
  end

  def down
  	remove_column :emails, :recipient_id
  	add_column :emails, :receipient_id, :integer
  end
end
