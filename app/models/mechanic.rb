class Mechanic < ApplicationRecord
  has_many :maintenences
  has_many :rides, through: :maintenences
end
