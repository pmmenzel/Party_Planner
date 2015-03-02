class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date
      t.string :location
      # public_party:  if guests are or are not allowed.  we will have other options if it is public.
      t.boolean :public_party
      t.integer :user_id
      t.integer :guestlist_id

      t.timestamps
    end
  end
end
