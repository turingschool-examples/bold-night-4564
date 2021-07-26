class AmusementParksController < ApplicationController
  def show
    @park = AmusementPark.find(params[:id])
    rides = @park.rides
    @alpha = rides.alphabetize
  end
end
