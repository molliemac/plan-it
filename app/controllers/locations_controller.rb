class LocationsController < ApplicationController

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
     req.params['client_id'] = ENV['FOURSQUARE_CLIENT_ID']
     req.params['client_secret'] = ENV['FOURSQUARE_CLIENT_SECRET']
     req.params['v'] = '20160201'
     req.params['near'] = params[:zipcode]
     req.params['query'] = params[:query]
     req.params['categories'] = params[:categories]
    end

    body_hash = JSON.parse(@resp.body)
    @venues = body_hash["response"]["venues"]
    @categories = params[:category]
  end

 def saved_search_add
  @saved_search = Location.create(:query => params[:q])

  respond_to do |format|
    if @saved_search.save
      format.html { redirect_to(:back) }
    else
      format.html { redirect_to(:back) }
    end
  end
end

end 

