class GuidesController < ApplicationController
require 'yelp'
  include HTTParty

  def index
    @languages = %w(English Spanish German French Italian Portuguese Japanese Korean Turkish Mandarin Cantonese)
    @location = params[:location].split(",")[0]
    @full_location = params[:location]

    @start_date = params[:from]
    @end_date = params[:to]

    @images = HTTParty.get("https://pixabay.com/api/?key=#{ENV['pixabay_api']}&q=#{params[:location].split(",")[0]}+cityscape&image_type=photo")

    session["events"] ||= (session["events"] = [])
    @pic = @images["hits"][0]["webformatURL"]
    @language = params[:language]
    @guides = Guide.all.where(location: @location, language: @language.downcase)
    
    ##########---------YELP---------##########
    
    @api_call = Yelp.client.search(@location, { term: 'events', limit: 16 }).businesses

  end

  def new
    @guide = Guide.new
  end

  def create
    @guide = Guide.new(guide_params)
    if @guide.save
      session[:guide_id] = @guide.id
      redirect_to guide_path(@guide)
    else
      @errors = @guide.errors.full_messages
      render 'new'
    end
  end

  def show
    p "*" * 200
    p params
    @guide = Guide.find(params[:id])
    @conversation = Conversation.new
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
    redirect_to root_pa th
  end

  private

  def guide_params
    params.require(:guide).permit(:first_name, :last_name, :email, :password, :password_confirmation, :language, :phone, :location, :has_car)
  end

end
