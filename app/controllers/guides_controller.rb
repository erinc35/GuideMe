class GuidesController < ApplicationController
  require 'yelp'
  require 'unsplash'

  include HTTParty

  def add_guide
    session["guide"] = Guide.find(params[:guide_id]).email
    if request.xhr?
      p "%" * 200
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
    end

    @language = params[:language]
    # @guides = Guide.all.where(location: @location, language: @language)
    @guides = Guide.all.where(location: @location)

    # @unsplash_object = Unsplash::Photo.search(@location)
    # @pic = @unsplash_object[0].urls["full"]

    ##########---------YELP---------##########

    @events_call = Yelp.client.search(@location, { term: 'events', limit: 16 }).businesses
    @restaurants_call = Yelp.client.search(@location, { term: 'restaurants', limit: 16 }).businesses
    @attractions_call = Yelp.client.search(@location, { term: 'attractions', limit: 16 }).businesses

    p @events_locations = @events_call.map { |event| event.location.display_address[0] }
    p @restaurants_locations = @restaurants_call.map { |restaurant| restaurant.location.display_address[0] }
    p @attractions_locations = @attractions_call.map { |attraction| attraction.location.display_address[0] }

  end

  def new
    @guide = Guide.new
  end

  def create
    @guide = Guide.new(guide_params)
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
    guide = Guide.find(params[:id])
    if current_user && current_user.class == Guide
      if current_user.id == guide.id
        @converstations = Converstation.involving(current_user)
      end
    end
  end

  def edit
    @guide = Guide.find(params[:id])
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

  def guide_params
    params.require(:guide).permit(:first_name, :last_name, :email, :password, :password_confirmation, :language, :phone, :location, :has_car, :online)
  end

end
