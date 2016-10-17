class TravelersController < ApplicationController

  def index
     @travelers = Traveler.where.not("id = ?",current_user.id).order("created_at DESC")
     @conversations = Conversation.involving(current_user).order("created_at DESC")
   end

  def new
    @traveler = Traveler.new
  end

  def create
    #################################
    # Make sure to add error messages
    @traveler = Traveler.new(traveler_params)
    if @traveler.save
      session[:traveler_id] = @traveler.id
      @traveler.online = "yes"
      redirect_to traveler_path(@traveler)
    else
      render 'new'
    end
  end

  def show
    @traveler = Traveler.find(params[:id])
  end

  def edit
    @traveler = Traveler.find(params[:id])
  end

  def update
    @traveler = Traveler.find(params[:id])
    if @traveler.update(traveler_params)
      redirect_to traveler_path(@traveler)
    else
      render 'edit'
    end
  end

  def destroy
    Traveler.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def traveler_params
    params.require(:traveler).permit(:first_name, :last_name, :email, :password, :password_confirmation, :language, :phone)
  end
end
