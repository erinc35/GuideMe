class TripsController < ApplicationController
  def index
    @trip = Trip.find_by(traveler_id: session[:traveler_id])
    traveler = Traveler.find(session[:traveler_id])
    @trips = traveler.trips
    @guide = Guide.find(@trip.guide_id)
    @location = @trip.location
    @unsplash_object = Unsplash::Photo.search(@location)
    @pic = @unsplash_object[0].urls["full"]
  end

  def new
  end

  def create
  end

  def show
    @trip = Trip.find_by(traveler_id: session[:traveler_id])
    @traveler = Traveler.find(session[:traveler_id])
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
