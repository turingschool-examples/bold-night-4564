class Maintenance < ApplicationRecord
  # validates :
  belongs_to :ride
  belongs_to :mechanic
end