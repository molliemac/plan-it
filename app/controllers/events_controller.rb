class EventsController < ApplicationController
	def index
		@my_events = Event.all
	end

	def show
		
	end

	def new
		@my_event = Event.new
	end

	def create
		@my_event = Event.new(event_params)
		  if @my_event.save
		    flash[:notice] = 'Your event has been created'
		    redirect_to events_path
		  else
		    flash.now[:warning] = 'There were problems when trying to create a new event'
		    render :action => :new
		  end
	end

	def destroy
	end

	private

	def event_params
	  params.require(:event).permit(:name, :date, :time, :location, :description)
	 end
end
