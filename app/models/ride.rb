class Ride < ApplicationRecord
  has_many :maintenences 
  has_many :mechanics, through: :maintenences
end
