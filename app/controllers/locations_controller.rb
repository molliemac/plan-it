class LocationsController < ApplicationController

  def index
  	@nearby = Foursquare.new(@name,@zipcode)
  end

  def new
	@nearby = Foursquare.new(@name,@zipcode)
  	
  end

  def create
  	@near = Event.new(event_params)
  end

  def list
  	@nearby = Foursquare.search_venues(params[:near], params[:query])
  end

end

