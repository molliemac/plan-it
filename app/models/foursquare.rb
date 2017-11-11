class Foursquare

	def initialize(name, zipcode)
		@name = name
		@zipcode = zipcode
	end

	def self.search_venues(name, zipcode)
    	client.search_venues(:near => zipcode, :query => name, :v => '20170711', :limit => '5')
  	end

  def self.client
    @client ||= Foursquare2::Client.new(:client_id => ENV['FOURSQUARE_CLIENT_ID'], :client_secret => ENV['FOURSQUARE_CLIENT_SECRET'])
  end

  def self.find(name, zipcode)
  	client.search_venues(:near => zipcode, :query => name, :v => '20170711', :limit => '5')
  end
  
end
