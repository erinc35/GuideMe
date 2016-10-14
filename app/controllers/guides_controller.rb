class GuidesController < ApplicationController
  def new
    @Guide = Guide.new
  end

  def create
    @Guide = Guide.new(guide_path)
    if @Guide.save
      redirect_to guide_path(@Guide)
    else
      render 'new'
    end
  end

  def show
    @Guide = Guide.find(params[:id])
  end

  def edit
    @Guide = Guide.find(params[:id])
  end

  def update
    @Guide = Guide.find(params[:id])
    if @Guide.update(guide_params)
      redirect_to guide_path(@Guide)
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
    params.require(:Guide).permit(:first_name, :last_name, :email, :password, :password_confirmation, :language, :phone, :location, :has_car, :photo, :online)
  end
end
