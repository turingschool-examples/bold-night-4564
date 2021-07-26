class Ride < ApplicationRecord
  has_many :workloads
  has_many :mechanics, through: :workloads
end
