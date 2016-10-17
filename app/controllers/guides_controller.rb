class GuidesController < ApplicationController
require 'yelp'
  include HTTParty

  def index
     @location = params[:location]
     @languages = %w(English Spanish German French Italian Portuguese Japanese Korean Turkish Mandarin Cantonese)
     @location = params[:location].split(",")[0]
     @full_location = params[:location]

     @start_date = params[:from]
     @end_date = params[:to]

     @images = HTTParty.get("https://pixabay.com/api/?key=#{ENV['pixabay_api']}&q=#{params[:location].split(",")[0]}+cityscape&image_type=photo")

    #  @pic = @images["hits"][0]["webformatURL"]
    session["events"] ||= (session["events"] = [])
     @language = params[:language]
     @guides = Guide.all.where(location: @location)
     @language = params[:language]
    if current_user
      @guides = Guide.where.not("id = ?",current_user.id).order("created_at DESC")
      @conversations = Conversation.involving(current_user).order("created_at DESC")
    end

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
      @guide.online = "yes"
      redirect_to guide_path(@guide)
    else
      @errors = @guide.errors.full_messages
      render 'new'
    end
  end

  def show
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
    params.require(:guide).permit(:first_name, :last_name, :email, :password, :password_confirmation, :language, :phone, :location, :has_car, :online)
  end

end
