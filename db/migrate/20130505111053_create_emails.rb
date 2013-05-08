class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :subject
      t.text :body
      t.datetime :send_time
      t.boolean :sent

      t.timestamps
    end
  end
end
