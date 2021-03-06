class LocationsController < ApplicationController
  def index
    locations = Location.all
    render json: { data: locations }, status: :ok
  end

  def show
    if location = Location.find_by_id(params[:id])
      render json: { data: location }, status: :ok
    else
      render json: { message: "Location with id #{params[:id]} does not exist" }, status: :bad_request
    end
  end

  def create
    location = Location.create(location_params)
    if location.valid?
      render json: { data: location }, status: :ok
    else
      errors = location.errors.messages.map{ |column, errors| "#{column} #{errors.join}" }
      render json: { message: 'Could not create new location entry', errors: errors }, status: :bad_request
    end
  end

  def location_params
    params.permit(:name, :sizetype, :hold)
  end
end
