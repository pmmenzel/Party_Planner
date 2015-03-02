class Guestlist < ActiveRecord::Base
	has_one :event
  has_many :users, through: :event
end
