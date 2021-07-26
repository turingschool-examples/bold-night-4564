class MaintenancesController < ApplicationController
  def create
    mechanic = Mechanic.find(params[:mech_id])
    ride = Ride.find(params[:ride_id])

    Maintenance.create!(ride: ride, mechanic: mechanic)
    redirect_to "/mechanics/#{mechanic.id}"
  end
end
