class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :email
      t.string :guest_user_name

      t.timestamps
    end
  end
end
