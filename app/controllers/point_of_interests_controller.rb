class PointOfInterestsController < ApplicationController
  def index
    location = set_location
    point_of_interests = location.point_of_interests.all
    render json: { data: point_of_interests }, status: :ok
  end

  def show
    location = set_location
    point_of_interest = location.point_of_interests.find_by_id(params[:id])
    render json: { data: point_of_interest }, status: :ok
  end

  def create
    location = set_location
    point_of_interest = location.point_of_interests.create(point_of_interest_params)
    render json: { data: point_of_interest }, status: :ok
  end

  private
  def point_of_interest_params
    params.permit(:name, :buildingtype, :description)
  end

  def set_location
    Location.find_by_id(params[:location_id])
  end
end
