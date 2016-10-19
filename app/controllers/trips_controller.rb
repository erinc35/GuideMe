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
    p "*%$" * 200
    p params[:guide_id]
    @trip = Trip.find_by(traveler_id: session[:traveler_id], guide_id: params[:guide_id])
    @traveler = Traveler.find(session[:traveler_id])
    @guide = Guide.find(@trip.guide_id)
  end

  def checkout
    @trip = Trip.new(location: params[:location], start_date: params[:start_date], end_date: params[:end_date])
    @trip.guide = Guide.find_by(email: session["guide"])

    if session[:traveler_id]
      @traveler = Traveler.find(session[:traveler_id])
    else
      redirect_to new_traveler_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
