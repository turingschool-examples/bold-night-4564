class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @average_years_experience = Mechanic.average_mechanic_experience
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.open_rides_by_thrill_rating
  end
end
