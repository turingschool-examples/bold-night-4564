class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @average_exp = Mechanic.av_exp
    binding.pry
  end
  def show
    @mechanic = Mechanic.find(params[:id])
  end
end