class GuidesController < ApplicationController
  def index
    @location = params[:location]
    @guides = Guide.all.where(location: @location)
  end

  def new
    @guide = Guide.new
  end

  def create
    #################################
    # Make sure to add error messages
    @guide = Guide.new(guide_params)
    if @guide.save
      redirect_to guide_path(@guide)
    else
      render 'new'
    end
  end

  def show
    @guide = Guide.find(params[:id])
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
    params.require(:guide).permit(:first_name, :last_name, :email, :password, :password_confirmation, :language, :phone, :location, :has_car)
  end
end
