class Item < ActiveRecord::Base
  belongs_to :event

  validate :name, :quantity, :event_id, :presence => true

  validates_numericality_of :quantity, :only_integer =>true,
                            :greater_than_or_equal_to =>1,
                            :message => "Can't be a negative number"
end
