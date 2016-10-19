class ChargesController < ApplicationController
  def new
    @guide = Guide.find(params[:guide_id])
  end

  def create
    p "-*-*" * 200
    p params
    @trip = Trip.new(guide_id: params[:guide_id], traveler_id: session[:traveler_id], interests: params[:interests], requests: params[:requests])
    if @trip.save
      redirect_to trip_path(session[:traveler_id], guide_id: params[:guide_id])
    end
  end

  private

end
