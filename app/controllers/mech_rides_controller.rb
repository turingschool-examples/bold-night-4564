class MechRidesController < ApplicationController
  def create
    MechRide.create(mech_ride_params)
    redirect_to "/mechanics/#{mech_ride_params[:mechanic_id]}"
  end

  private

  def mech_ride_params
    params.permit(:mechanic_id, :ride_id)
  end
end