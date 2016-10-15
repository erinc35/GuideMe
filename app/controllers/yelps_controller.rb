class YelpsController < ApplicationController
  require 'yelp'
      Yelp.client.configure do |config|
         config.consumer_key = ENV['YELP_CONSUMER_KEY']
         config.consumer_secret = ENV['YELP_CONSUMER_SECRET']
         config.token = ENV['YELP_TOKEN']
         config.token_secret = ENV['YELP_TOKEN_SECRET']
       end
    def create
      search_result =  Yelp.client.search(location, { term: keyword })
    end
end
