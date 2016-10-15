class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

 def current_guide
   return unless session[:guide_id]
   @current_guide ||= Guide.find(session[:guide_id])
 end

 def current_traveler
   return unless session[:traveler_id]
   @current_traveler ||= Traveler.find(session[:traveler_id])
 end
end


# Push to heroku
