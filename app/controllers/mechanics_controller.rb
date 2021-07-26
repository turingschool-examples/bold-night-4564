class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all  
  end    

  def show
    @mechanic = Mechanic.find(params[:id])  
  end

  def add_ride
    mechanic = Mechanic.find(params[:id])  
    ride = Ride.find(params[:ride_id])
    if ride.present?
      mechanic.rides << ride   
    end
    redirect_to "/mechanics/#{mechanic.id}"
  end
end