class Mechanic < ApplicationRecord
  has_many :work_orders
  has_many :rides, through: :work_orders

  def self.average_mechanic_experience
    average(:years_of_experience).to_i
  end
end
