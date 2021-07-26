class Mechanic < ApplicationRecord
  has_many :maintenances
  has_many :rides, through: :maintenances
end
