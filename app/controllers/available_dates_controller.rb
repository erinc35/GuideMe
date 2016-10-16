class AvailableDatesController < ApplicationController
  def show
  end

  def new
    @availabledate = AvailableDate.new
  end

  def create
    # @guide = Guide.find(session[:guide_id])
    p "***************"
    p params
    @availabledate = AvailableDate.new(available_params)
    if @availabledate.save
      redirect_to guide_path(@guide)
    else
      @errors = @availabledate.errors.full_messages
      render ''
    end
  end

  def update
    # @guide = Guide.find(session[:guide_id])
    @availabledate = AvailableDate.find(params[:id])

    if @availabledate.update(available_params)
      redirect_to guide_path(@guide)
    else
      render 'edit'
    end
  end

  def destroy
    AvailableDate.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def available_params
    p params
    p :availabledate
    params.require(:available_date).permit(:start_date, :end_date, :guide_id)
  end
end
