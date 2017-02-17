class Alarm < ActiveRecord::Base
   before_save :uppercase_content
   after_create :push_notification


   private

	def uppercase_content
		if !content.nil?
			self.content.upcase!
		end
	end

	def push_notification
		uri = URI.parse('http://handshake-bellbird.herokuapp.com/push')

		http = Net::HTTP.new( uri.host )
		#http.use_ssl = true

		request = Net::HTTP::Post.new(uri.path, {'Content-Type' => 'application/json'})
		request.body = self.to_json(:only => ["id"])

		response = http.request(request)

		Rails.logger.debug( "Push notification response: " + response.to_s )
	end

	handle_asynchronously :push_notification
end
