class MaintenancesController < ApplicationController
  # def index
    
  # end

  # def show
    
  # end
  
  # def new
    
  # end
  
  def create
    searched_ride = Ride.find(params[:search])
    mechanic = Mechanic.find(params[:id])
    mechanic.rides << searched_ride
    redirect_to "/mechanics/#{mechanic.id}"
  end
  
  # def edit
    
  # end
  
  # def update
    
  # end
  
  # def destroy
    
  # end
  
# private
#   def _params
#     params.permit(:)
#   end
end