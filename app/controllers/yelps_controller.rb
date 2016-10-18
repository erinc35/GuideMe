class YelpsController < ApplicationController
  require 'yelp'

  def index

  end

  def add
    @location = params[:location]

    @events_call = Yelp.client.search(@location, { term: 'events', limit: 16 }).businesses
    @restaurants_call = Yelp.client.search(@location, { term: 'restaurants', limit: 16 }).businesses
    @monuments_call = Yelp.client.search(@location, { term: 'monuments', limit: 16 }).businesses

    if params[:event] || params[:restaurant]
      yelp_event = @events_call.select { |business| business.name == params[:event] }[0]
      yelp_restaurant = @restaurants_call.select { |restaurant| restaurant.name == params[:restaurant] }[0]
      yelp_monument = @monuments_call.select { |monument| monument.name == params[:monument] }[0]
      p "O*" * 200
      if request.xhr?
        if yelp_event
          p "-*-*" * 200
          session["events"] << yelp_event.name
          render partial: 'guides/add_event', layout: false, locals: {event: yelp_event}
        elsif yelp_restaurant
          session["events"] << yelp_restaurant.name
          render partial: 'guides/add_restaurant', layout: false, locals: {restaurant: yelp_restaurant}
        end
      end
    end
  end

  def remove
    @location = params[:location]

    session["events"] ||= (session["events"] = [])
    @events_call = Yelp.client.search(@location, { term: 'events', limit: 16 }).businesses
    @restaurants_call = Yelp.client.search(@location, { term: 'restaurants', limit: 16 }).businesses

    if params[:event] || params[:restaurant] || params[:monument]
      yelp_event = @events_call.select { |business| business.name == params[:event]}[0]
      session["events"].delete(params[:event])
      session["events"].delete(params[:restaurant])
      session["events"].delete(params[:monument])
      if request.xhr?
        if session["events"].include?(params[:event])
          render partial: 'guides/remove_event', layout: false, locals: {event: yelp_event}
        elsif session["events"].include?(params[:restaurant])
          render partial: 'guides/remove_restaurant', layout: false, locals: {event: yelp_restaurant}
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
