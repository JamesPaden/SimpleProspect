class CreateReceipients < ActiveRecord::Migration
  def change
    create_table :receipients do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
