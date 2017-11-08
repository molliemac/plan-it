class Foursquare
	 def self.search_venues(text)
        client.search_venues(:ll => '36.142064,-86.816086', :query => text)
    end

    def self.client
        @client ||= Foursquare2::Client.new(:client_id => 'your_client_id', :client_secret => 'your_secret')
    end
end
