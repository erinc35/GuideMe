class StaticPagesController < ApplicationController
  def index
    p "838383___" * 200
    p session[:traveler_id]
    @languages = %w(English Spanish German French Italian Portuguese Japanese Korean Turkish Mandarin Cantonese)
  end
end
