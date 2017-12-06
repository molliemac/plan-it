class Event < ActiveRecord::Base
	has_many :event_users
	has_many :locations
	has_many :users, through: :event_users
end
