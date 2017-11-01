class EventUser < ActiveRecord::Base
	belongs_to :event
	belongs_to :user

	before_validation :set_user_id, if: :email?

	def set_user_id
	  self.user = User.invite!(email: email)
	end
end
