class TripsController < ApplicationController
  def index
    @trips = Trip.all

  end

  def new
  end

  def create
  end

  def show
    trips = Trip.all.where(traveler_id: params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
