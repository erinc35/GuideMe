class YelpsController < ApplicationController
  require 'yelp'

  def index

  end

  def add
    
  end

  def remove
    @location = params[:location]

    session["events"] ||= (session["events"] = [])
    @api_call = Yelp.client.search(@location, { term: 'events', limit: 16 }).businesses

    if params[:event]
      yelp_object = @api_call.select { |business| business.name == params[:event]}[0]
      if request.xhr?
        render partial: 'guides/remove_event', layout: false, locals: {event: yelp_object}
      else
        session["events"].delete(params[:event])
      end
    end
  end

  def create
    # search_result = Yelp.client.search(location, { term: keyword })
    @location = params[:location]

    session["events"] ||= (session["events"] = [])
    @api_call = Yelp.client.search(@location, { term: 'events', limit: 16 }).businesses

    if params[:event]
      yelp_object = @api_call.select { |business| business.name == params[:event]}[0]
      if request.xhr?
        render partial: 'guides/add_event', layout: false, locals: {event: yelp_object}
      else
        session["events"] << yelp_object.name
      end
    end
  end

  def destroy
  end

end
