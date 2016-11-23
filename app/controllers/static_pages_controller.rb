class StaticPagesController < ApplicationController
  def index
    @languages = %w(English Spanish German French Italian Portuguese Japanese Korean Turkish Mandarin Cantonese)
  end
end
