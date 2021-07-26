class Mechanic < ApplicationRecord
  has_many :work_orders
  has_many :rides, through: :work_orders

  def self.avg_experience
    average(:years_of_experience)
  end
end
