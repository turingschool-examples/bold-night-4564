class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanics = Mechanic.find(params[:id])
    @rides = @mechanics.order_by_open_thrill
  end
end
