class Events::EventUsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_event

	def create
		event_user = @my_event.event_users.new(event_user_params)
		event_user.event = @my_event

		if event_user.save
		    redirect_to @my_event, notice: 'Invite Sent!'
		  else
		    redirect_to @my_event, alert: 'Failed!'
		end
	end


	private
		def set_event
			@my_event = current_user.events.find(params[:event_id])
		end

		def event_user_params
			params.require(:event_user).permit(:email)
		end
end