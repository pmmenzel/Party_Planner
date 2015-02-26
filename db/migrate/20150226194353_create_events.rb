class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :date
      t.string :location
      t.boolean :public_party

      t.timestamps
    end
  end
end
