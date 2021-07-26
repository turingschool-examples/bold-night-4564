class Mechanic < ApplicationRecord
  validates :name, presence: true

  has_many :maintenances
  has_many :rides, through: :maintenances

  def self.average_years_experience
    average(:years_of_experience).to_f
  end

  def order_by_thrill_rating
    rides.where(open: true).order(thrill_rating: :desc)
  end
end
