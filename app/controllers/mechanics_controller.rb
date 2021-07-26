class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:mech_id])
    @ride = Ride.find(params[:ride_id])
    # require "pry"; binding.pry
  end
end
