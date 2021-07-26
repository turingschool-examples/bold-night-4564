class Park < ApplicationRecord
  has_many :rides

  def rides_by_name
    rides.order(:name)
  end

  def average_thrill_rating
    rides.average(:thrill_rating).to_i
  end
end
