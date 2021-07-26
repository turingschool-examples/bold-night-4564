class Ride < ApplicationRecord
  belongs_to :park
  has_many :maintenences 
  has_many :mechanics, through: :maintenences
end
