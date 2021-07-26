class RideMechanicsController < ApplicationController
  def create
    mechanic = Mechanic.find(params[:mechanic_id])
    ride = Ride.find_by(id: params[:ride_id])
    RideMechanic.create(ride: ride, mechanic: mechanic)
    
    redirect_to "/mechanics/#{mechanic.id}"
  end
end