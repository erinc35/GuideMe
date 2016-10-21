class SessionsController < ApplicationController
  def new
  end

  def create
    @guide = Guide.find_by_email(params[:email])
    @traveler = Traveler.find_by_email(params[:email])

    if @guide && @guide.authenticate(params[:password])
      session[:guide_id] = @guide.id
      @guide.online = "yes"
      @guide.save
      redirect_to guide_path(@guide)
    elsif @traveler && @traveler.authenticate(params[:password])
      @traveler.online = "yes"
      @traveler.save
      session[:traveler_id] = @traveler.id
      redirect_to traveler_path(@traveler)
    else
      if params[:email] == "" && params[:password] == ""
        @errors = ["Can't leave email empty!", "Can't leave password empty!"]
      elsif params[:email] == ""
        @errors = ["Can't leave email empty!"]
      elsif params[:password] == ""
        @errors = ["Can't leave password empty!"]
      else
        @errors = ["Incorrect Email or Password!"]
      end
      render 'new'
    end
  end

  def destroy
    if session[:guide_id]
      @guide = Guide.find(session[:guide_id])
      @guide.online = "no"
      session[:guide_id] = nil
      redirect_to root_path
    elsif session[:traveler_id]
      @traveler = Traveler.find(session[:traveler_id])
      @traveler.online = "no"
      session[:traveler_id] = nil
      redirect_to root_path
    end
  end

end
