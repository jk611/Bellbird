class WelcomeController < ApplicationController
	def index
		@alarm = Alarm.new
	end
end
