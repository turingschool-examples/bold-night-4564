class ParksController < ApplicationController
  def show
    @park = Park.find(park_params[:id])
    @park_rides = @park.rides.order(name: :asc)
    @thrill = @park.rides.average(:thrill_rating)
  end
  private

  def park_params
    params.permit(:id)
  end
end