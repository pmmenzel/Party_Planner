class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :guestlist
  has_many :items

  validates :name, :date, :location, :presence => true

  validates :name, length: { minimum: 3 }

  validate :event_date_cannot_be_in_the_past

  def event_date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "cannot be in the past")
    end
  end

end
