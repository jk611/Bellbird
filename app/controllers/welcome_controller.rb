class WelcomeController < ApplicationController
	def index
		@alarm = Alarm.new
		@alarms = Alarm.sorted_by_rank
	end
end
