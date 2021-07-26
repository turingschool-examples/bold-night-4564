class Mechanic < ApplicationRecord
  has_many :mech_rides
  has_many :rides, through: :mech_rides

  def self.av_exp
    average(:years_of_experience).to_i
  end
end
