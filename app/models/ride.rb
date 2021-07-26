class Ride < ApplicationRecord
  has_many :maintenances
  has_many :mechanics, through: :maintenances

  def self.open_thrill
    where(open: :true).order(thrill_rating: :desc)  
  end

  def self.find_ride(id)
    where("id = '#{id}'")  
  end
end