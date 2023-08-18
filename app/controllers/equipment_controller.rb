class EquipmentController < ApplicationController
  def index
    render json: EquipmentSerializer.render(Equipment.all), status: :ok
  end
end
