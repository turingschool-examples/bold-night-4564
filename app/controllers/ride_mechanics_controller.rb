class RideMechanicsController < ApplicationCOntroller
  def create
    mechanic = Mechanic.find(params[:id])
    ride = Ride.find_by(id: params[:ride_id])
    RideMechanic.create(ride: ride, mechanic: mechanic)
    
    redirect_to "/mechanics/#{mechanic.id}"
  end
end