class Ride < ApplicationRecord
  # validates :
  belongs_to :amusement_park
  has_many :maintenances
  has_many :mechanics, through: :maintenances
end