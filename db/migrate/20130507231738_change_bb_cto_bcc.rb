class ChangeBbCtoBcc < ActiveRecord::Migration
  def change
  	rename_column :users, :bbc, :bcc
  end
end