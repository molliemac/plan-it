class Foursquare

	def initialize(name, zipcode)
		@name = name
		@zipcode = zipcode
	end

	def self.search_venues(name, zipcode)
    	venues = client.search_venues(:ll => '36.142064,-86.816086', :query => name, :v => '20170711', :limit => '5')
  	end

  def self.client
    @client ||= Foursquare2::Client.new(:client_id => ENV['FOURSQUARE_CLIENT_ID'], :client_secret => ENV['FOURSQUARE_CLIENT_SECRET'])
  end

  def self.find(name, zipcode)
  	client.search_venues(:ll => zipcode, :query => name, :v => '20170711', :limit => '5')
  end

    def save_location
    @saved_location = Location.create(:query => params[:q])

  end
 
end
