class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @average_work = Mechanic.average_work
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @mechanic_rides = @mechanic.rank_open_rides
  end
  
#   def new
    
#   end
  
#   def create
    
#   end
  
#   def edit
    
#   end
  
#   def update
    
#   end
  
#   def destroy
    
#   end
  
# private
#   def _params
#     params.permit(:)
#   end
end