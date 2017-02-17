class WelcomeController < ApplicationController
	def index
		@alarm = Alarm.new
		@alarms = Alarm.all.order! 'created_at DESC'
	end
end
