class TripsController < ApplicationController
  def index
    @trips = Trip.all

  end

  def new
  end

  def create
  end

  def show
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
