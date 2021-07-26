class Mechanic < ApplicationRecord
  # validates :
  has_many :maintenances
  has_many :rides, through: :maintenances

  def self.average_work
    average(:years_of_experience).to_f
  end

  def rank_open_rides
    rides.where(open: true).order(thrill_rating: :desc)
  end
end