class MechanicRidesController < ApplicationController
  def create
    mechanic = Mechanic.find(params[:id])
    mechanic_ride = MechanicRide.create!(ride_id: params[:ride_id], mechanic_id: params[:id])

    redirect_to "/mechanics/#{mechanic.id}"
  end
end
