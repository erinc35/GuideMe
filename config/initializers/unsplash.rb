Unsplash.configure do |config|
  config.application_id     = ENV["unsplash_ap_id"]
  config.application_secret = ENV["unsplash_secret"]
  config.application_redirect_uri = ENV["unsplash_secret"]
end
