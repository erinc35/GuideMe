class YelpsController < ApplicationController
  require 'yelp'

  def index

  end

  def add
    @location = params[:location]

    @events_call = Yelp.client.search(@location, { term: 'events', limit: 16 }).businesses
    @restaurants_call = Yelp.client.search(@location, { term: 'restaurants', limit: 16 }).businesses
    @attractions_call = Yelp.client.search(@location, { term: 'attractions', limit: 16 }).businesses

    if params[:event] || params[:restaurant] || params[:attraction]
      yelp_event = @events_call.select { |business| business.name == params[:event] }[0]
      yelp_restaurant = @restaurants_call.select { |restaurant| restaurant.name == params[:restaurant] }[0]
      yelp_attraction = @attractions_call.select { |attraction| attraction.name == params[:attraction] }[0]
      p "O*" * 200
      if request.xhr?
        if yelp_event
          p "-*-*" * 200
          session["events"] << yelp_event.name
          render partial: 'guides/add_event', layout: false, locals: {event: yelp_event}
        elsif yelp_restaurant
          session["events"] << yelp_restaurant.name
          render partial: 'guides/add_restaurant', layout: false, locals: {restaurant: yelp_restaurant}
        elsif yelp_attraction
          session["events"] << yelp_attraction.name
          render partial: 'guides/add_attraction', layout: false, locals: {attraction: yelp_attraction}
        end
      end
    end
  end

  def remove
    @location = params[:location]

    session["events"] ||= (session["events"] = [])
    @events_call = Yelp.client.search(@location, { term: 'events', limit: 16 }).businesses
    @restaurants_call = Yelp.client.search(@location, { term: 'restaurants', limit: 16 }).businesses
    @attractions_call = Yelp.client.search(@location, { term: 'attractions', limit: 16 }).businesses

    if params[:event] || params[:restaurant] || params[:attraction]
      yelp_event = @events_call.select { |business| business.name == params[:event]}[0]
      yelp_restaurant = @restaurants_call.select { |restaurant| restaurant.name == params[:restaurant]}[0]
      yelp_attraction = @attractions_call.select { |attraction| attraction.name == params[:attraction]}[0]
      if request.xhr?
        if session["events"].include?(params[:event])
          session["events"].delete(params[:event])
          render partial: 'guides/remove_event', layout: false, locals: {event: yelp_event}
        elsif session["events"].include?(params[:restaurant])
          session["events"].delete(params[:restaurant])
          render partial: 'guides/remove_restaurant', layout: false, locals: {restaurant: yelp_restaurant}
        elsif session["events"].include?(params[:attraction])
          session["events"].delete(params[:attraction])
          render partial: 'guides/remove_attraction', layout: false, locals: {attraction: yelp_attraction}
        end
      end
    end
  end

  def create
    # search_result = Yelp.client.search(location, { term: keyword })
  end

  def destroy
  end

end
