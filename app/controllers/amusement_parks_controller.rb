class AmusementParksController < ApplicationController
  def index
    @parks = AmusementPark.all
  end
  def show
    @park = AmusementPark.find(params[:id])
    rides = @park.rides
    @alpha = rides.alphabetize
  end
end
