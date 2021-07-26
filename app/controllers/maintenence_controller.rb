class MaintenenceController < ApplicationController
  def create
    @mechanics = Mechanic.find(params[:id])
    @ride = Ride.find(params[:ride_id])
    maintenence = Maintenence.create(mechanic: @mechanics, ride: @ride)
    maintenence.save

    redirect_to("/mechanics/#{@mechanics.id}")
  end
end
