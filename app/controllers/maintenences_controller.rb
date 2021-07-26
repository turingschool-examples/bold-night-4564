class MaintenencesController < ApplicationController 
  def create 
    mechanic = Mechanic.find(params[:id])
    ride = Ride.find_by(id: params[:ride_id])
    Maintenence.create(ride_id: ride.id, mechanic_id: mechanic.id)
   
    redirect_to "/mechanics/#{mechanic.id}"
  end
end