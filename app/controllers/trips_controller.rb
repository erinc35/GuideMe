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
    @guide = Guide.find(@trip.guide_id)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
