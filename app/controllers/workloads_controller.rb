class WorkloadsController < ApplicationController
  def create
    mechanic = Mechanic.find(params[:mechanic_id])
    ride = Ride.find(params[:ride_id])
    Workload.create!(ride: ride, mechanic: mechanic)
    redirect_to "/mechanics/#{mechanic.id}"
  end
end
