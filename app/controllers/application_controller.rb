class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, only: Proc.new{|c| c.request.json?}

  helper_method :current_user

  def current_user
    return unless session[:guide_id] || session[:traveler_id]

    if session[:guide_id]
      @current_user ||= Guide.find(session[:guide_id])
    elsif session[:traveler_id]
      @current_user ||= Traveler.find(session[:traveler_id])
    else
      @current_user = nil
    end
  end

  def current_guide
    return unless session[:guide_id]
    @current_guide ||= Guide.find_by(id: session[:guide_id])
  end

  def current_traveler
    return unless session[:traveler_id]
    @current_traveler ||= Traveler.find_by(id: session[:traveler_id])
  end

  private

  def require_login
    redirect_to root_path unless session[:guide_id] || session[:traveler_id]
  end
end
