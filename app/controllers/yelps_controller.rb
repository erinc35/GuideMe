class YelpsController < ApplicationController
  require 'yelp'

  def index

  end

  def add
    
  end

  def remove
    session["events"].delete(params[:event])
    redirect_to guides_path
  end

  def create
    # search_result = Yelp.client.search(location, { term: keyword })
    
    session["events"] ||= (session["events"] = [])

    if params[:event]
      p "0" * 200
      session["events"] << params[:event]
      p session["events"]
    end
  end

  def destroy
  end

end
