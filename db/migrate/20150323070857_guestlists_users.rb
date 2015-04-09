class GuestlistsUsers < ActiveRecord::Migration
  def change
    create_table :guestlists_users do |t|
      t.integer :guestlist_id
      t.integer :user_id

      t.timestamps
    end
  end
end
