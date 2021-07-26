class MaintenancesController < ApplicationController

  def create
      @maintenance = Maintenance.create!(ride: Ride.find(params[:ride_id]), mechanic: Mechanic.find(params[:id]))
      redirect_to "/mechanics/#{params[:id]}"
  end

end
