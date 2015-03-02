class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :guestlist
  has_many :items
end
