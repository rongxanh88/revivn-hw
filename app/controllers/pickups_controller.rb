class PickupsController < ApplicationController
  def index
    render json: PickupSerializer.render(Pickup.all), status: :ok
  end

  def create
    pickup = Pickup.new(create_params)
    pickup.status = 'submitted'
    if pickup.save
      render json: PickupSerializer.render(pickup), status: :created
    else
      render(json: { errors: ['Unable to save pickup'] }, status: :bad_request)
    end
  end

  private

  def create_params
    params.permit(:address, :address_2, :city, :state, :zip_code, :equipment_id)
  end
end
