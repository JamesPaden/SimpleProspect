class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :subject
      t.text :body
      t.integer :delay

      t.timestamps
    end
  end
end
