class YelpsController < ApplicationController
  require 'yelp'

    def create
      search_result =  Yelp.client.search(location, { term: keyword })
    end
end
