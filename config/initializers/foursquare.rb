# Store the environment variables on the Rails.configuration object
 Rails.configuration.foursquare = {
   client_id: ENV['CLIENT_ID'],
   client_secret: ENV['CLIENT_SECRET']
 }
 
