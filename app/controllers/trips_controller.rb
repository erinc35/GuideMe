class TripsController < ApplicationController
  def index
    traveler = Traveler.find(session[:traveler_id])
    @trips = traveler.trips
  end

  def new
  end

  def create
  end

  def show
    @trip = Trip.find_by(traveler_id: session[:traveler_id])
    @traveler = Traveler.find(session[:traveler_id])

    @guide = Guide.find(params[:guide_id])
    @location = @trip.location
    @unsplash_object = Unsplash::Photo.search(@location)
    @pic = @unsplash_object[0].urls["full"]

    @guide = Guide.find(@trip.guide_id)

  end

  def edit
  end

  def update
  end

  def destroy
  end
end
