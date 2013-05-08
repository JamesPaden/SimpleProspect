class CreateRecipients < ActiveRecord::Migration
	def up
		create_table :recipients do |t|
			t.string :name
			t.string :email
			t.integer :campaign_id
			t.timestamps
		end
		drop_table :receipients
	end

	def down
	end
end
