class TravelersController < ApplicationController
  def new
    @traveler = Traveler.new
  end

  def create
    @traveler = Traveler.new(traveler_params)
    if @traveler.save
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
