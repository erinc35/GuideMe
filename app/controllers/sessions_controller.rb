class SessionsController < ApplicationController
  def new
  end

  def create
    guide = Guide.find_by_email(params[:email])
    p guide
    traveler = Traveler.find_by_email(params[:email])
    p traveler
    if guide
      "-" * 50
      if guide.save
        "*" * 50
        session[:guide_id] = guide.id
        redirect_to guide_path(guide)
      end
    elsif traveler
      if traveler.save
        session[:traveler_id] = traveler.id
        redirect_to traveler_path(traveler)
      end
    else
      render 'new'
    end
  end

  def destroy
    if session[:guide_id]
      session[:guide_id] = nil
      redirect_to root_path
    elsif session[:traveler_id]
      session[:traveler_id] = nil
      redirect_to root_path
    end
  end

end
