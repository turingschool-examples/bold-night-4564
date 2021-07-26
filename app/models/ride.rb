class Ride < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :thrill_rating
  # validates :open, inclusion: [true, false]

  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  def self.only_open
    where('open = true')
  end

  def self.desc_thrill
    order(thrill_rating: :desc)
  end
end
