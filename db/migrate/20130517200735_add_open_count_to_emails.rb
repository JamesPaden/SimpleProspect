class AddOpenCountToEmails < ActiveRecord::Migration
  def change
  	add_column :emails, :open_count, :integer, :default => 0
  end
end
