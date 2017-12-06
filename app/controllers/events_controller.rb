class EventsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_event, only: [:show, :edit, :update, :destroy]

	def index
		@my_events = current_user.events
	end

	def show
		@my_event = Event.find(params[:id])
	end

	def new
		@my_event = Event.new
	end

	def create
		@my_event = Event.new(event_params)
		@my_event.event_users.new(user: current_user, role: "organizer")
			if @my_event.save
				redirect_to events_path, notice: "#{@my_event.name} has been created."
		  else
		    flash.now[:warning] = 'There were problems when trying to create a new event'
		    render :action => :new
		  end
	end

	def destroy
	end

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


	private

	def event_params
	  params.require(:event).permit(:name, :date, :time, :location, :description)
	 end

	def set_event
		@my_event = current_user.events.find(params[:id])
	end
end
