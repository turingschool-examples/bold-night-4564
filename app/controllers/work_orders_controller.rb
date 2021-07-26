class WorkOrdersController < ApplicationController

  def create
    mechanic = Mechanic.find(params[:mechanic_id])
    WorkOrder.create(ride_id: params[:ride_id], mechanic_id: mechanic.id)

    redirect_to "/mechanics/#{mechanic.id}"
  end
end
