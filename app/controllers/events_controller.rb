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
		@my_event.user = current_user

	end

	def destroy
	end

	private

	def event_params
	  params.require(:event).permit(:name, :date, :time, :location, :description)
	 end

	#def authorize_user
		#event = Event.find(params[:id])

		#unless current_user == event.user || current_user.collaborator?
			#flash[:alert] = "You must be invited to this event to view it."
			#redirect_to events_path
		#end
	#end
end
