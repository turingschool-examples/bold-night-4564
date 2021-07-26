class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.open_rides.order_by_thrill
  end

  def update
    Mechanic.add_ride(params[:id], params[:ride_id])

    redirect_to "/mechanics/#{params[:id]}"
  end
end
