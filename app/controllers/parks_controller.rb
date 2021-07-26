class ParksController < ApplicationController
  def show
    @park = Park.find(park_params[:id])
  end
  private

  def park_params
    params.permit(:id)
  end
end