class Event < ActiveRecord::Base
  belongs_to :user
  has_one :guestlist
  has_many :items
end
