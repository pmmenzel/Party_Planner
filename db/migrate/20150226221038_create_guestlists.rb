class CreateGuestlists < ActiveRecord::Migration
  def change
    create_table :guestlists do |t|
      t.integer :event_id

      t.timestamps
    end
  end
end
