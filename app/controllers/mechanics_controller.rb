class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.open_rides_by_thrill
  end

  def add_ride
    @mechanic = Mechanic.find(params[:id])
    @ride = Ride.find(params[:ride_id])
    mech_ride = MechanicRide.create(mechanic: @mechanic, ride: @ride)
    mech_ride.save
    redirect_to("/mechanics/#{@mechanic.id}")
  end
end
