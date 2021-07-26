class AmusementParksController < ApplicationController

  def show
    @park = AmusementPark.find(params[:id])
    @rides = @park.rides_in_alphabetical_order
  end

end
