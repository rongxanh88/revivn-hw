class EquipmentController < ApplicationController
  def index
    render json: PickupSerializer.render(Pickup.all), status: :ok
  end
end
