class AmusementParksController < ApplicationController
  def show
    @amusement_park = AmusementPark.find(params[:id])
    @rides = @amusement_park.rides.order_by_alpha
  end
end
