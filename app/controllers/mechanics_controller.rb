class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @average_exp = Mechanic.av_exp
  end
  def show
    @mechanic = Mechanic.find(params[:id])
    @mech_rides = @mechanic.rides.is_open.sort_by_thrill
  end
end