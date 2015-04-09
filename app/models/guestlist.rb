class Guestlist < ActiveRecord::Base
	has_one :event
  has_and_belongs_to_many :users #, through: :event
end
