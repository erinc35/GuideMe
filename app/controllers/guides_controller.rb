class GuidesController < ApplicationController
  require 'yelp'
  require 'unsplash'

  include HTTParty

  def add_guide
    session["guide"] = Guide.find(params[:guide_id]).email
    if request.xhr?
      render partial: 'remove_guide', layout: false, locals: { guide: Guide.find_by(email: session["guide"]) }
    end
  end

  def remove_guide
    current_guide = Guide.find_by(email: session["guide"])
    session["guide"] = ""
    if request.xhr?
      render partial: 'add_guide', layout: false, locals: { guide: Guide.find(current_guide.id) }
    end
  end

  def index
    @location = params[:location]
    @languages = %w(English Spanish German French Italian Portuguese Japanese Korean Turkish Mandarin Cantonese)
    @location = params[:location].split(",")[0]
    @full_location = params[:location]

    @start_date = params[:from]
    @end_date = params[:to]

    @images = HTTParty.get("https://pixabay.com/api/?key=#{ENV['pixabay_api']}&q=#{params[:location].split(",")[0]}+cityscape&image_type=photo")

    session["location"] ||= (session["location"] = "")
    session["events"] ||= (session["events"] = [])
    session["guide"] ||= (session["guide"] = "")

    if session["location"] != @location
      session["events"] = []
      session["guide"] = ""
      session["location"] = @location
    end

    @language = params[:language]
    @guides = Guide.all.where(location: @location)
    @guides_array = []


    @potential_guides = Guide.all.where(location: @location)
    @potential_guides.each do |guide|
      logged_trips = guide.trips
      logged_trips.each do |trip|
        if trip.end_date
          if trip.end_date < @start_date
            @guides_array << trip.guide
          end
        end
      end
    end

    @unsplash_object = Unsplash::Photo.search(@location)
    @pic = @unsplash_object[0].urls["full"]

    ##########---------YELP---------##########

    @events_call = Yelp.client.search(@location, { term: 'events', limit: 16 }).businesses
    @restaurants_call = Yelp.client.search(@location, { term: 'restaurants', limit: 16 }).businesses
    @attractions_call = Yelp.client.search(@location, { term: 'attractions', limit: 16 }).businesses

     @events_locations = @events_call.map { |event| event.location.display_address[0] }.join("&markers=")
     @restaurants_locations = @restaurants_call.map { |restaurant| restaurant.location.display_address[0] }.join("&markers=")
     @attractions_locations = @attractions_call.map { |attraction| attraction.location.display_address[0] }.join("&markers=")

  end

  def new
    @languages = %w(English Spanish German French Italian Portuguese Japanese Korean Turkish Mandarin Cantonese)
    @guide = Guide.new
  end

  def create
    @languages = %w(English Spanish German French Italian Portuguese Japanese Korean Turkish Mandarin Cantonese)

    @guide = Guide.new(guide_params)
    @guide.language = params[:language]
    if @guide.save
      session[:guide_id] = @guide.id
      @guide.online = "yes"
      redirect_to guide_path(@guide)
    else
      @errors = @guide.errors.full_messages
      render 'new'
    end
  end

  def show
    @guide = Guide.find(params[:id])
    if current_user && current_user.class == Guide
      if current_user.id == @guide.id
        @conversations = Conversation.involving(current_user).order("created_at DESC")
      end
    end
  end

  def edit
    @guide = Guide.find(params[:id])
    @avatar = params[:avatar]
    @avatar
  end

  def update
    @guide = Guide.find(params[:id])
    if @guide.update(guide_params)
      redirect_to guide_path(@guide)
    else
      render 'edit'
    end
  end

  def destroy
    Guide.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def location_params
    params.permit(:language)
  end

  def guide_params

    params.require(:guide).permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone, :location, :has_car, :online)
  end

end
