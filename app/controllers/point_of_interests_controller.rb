class PointOfInterestsController < ApplicationController
  def index
    location = Location.find_by_id(params[:location_id])
    point_of_interests = location.point_of_interests.all
    render json: { data: point_of_interests }, status: :ok
  end

  def show
    location = Location.find_by_id(params[:location_id])
    point_of_interest = location.point_of_interests.find_by_id(params[:id])
    render json: { data: point_of_interest }, status: :ok
  end

  def create
    render json: {}, status: :ok
  end
end
