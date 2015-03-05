class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :quantity
      t.text :description
      t.integer :event_id

      t.timestamps
    end
  end
end
