class AddStartAtToEvents < ActiveRecord::Migration
  def change
    add_column :events, :start_at, :time
    add_column :events, :end_at, :time
    add_column :events, :token, :string
  end
end
