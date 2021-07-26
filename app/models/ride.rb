class Ride < ApplicationRecord
  # validates :
  has_many :maintenances
  has_many :mechanics, through: :maintenances
end