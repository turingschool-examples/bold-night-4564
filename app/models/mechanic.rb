class Mechanic < ApplicationRecord
  has_many :workloads
  has_many :rides, through: :workloads
end
