class Alarm < ActiveRecord::Base
   before_save :uppercase_content
   after_create :push_notification

   validates :content, presence: { message: "MUST NOT BE BLANK" }

   def upvote
   	 self.votes = self.votes + 1
   	 self.save
   end

   def votes_string
   	if votes > 0
   		return votes.to_s + " vote".pluralize( votes )
   	end
   	return ""
   end

   def rank
   	# based on https://coderwall.com/p/cacyhw/an-introduction-to-ranking-algorithms-seen-on-social-news-aggregators
	s = votes
    order = Math.log10([s, 1].max)

    if s > 0
        sign = 1
    elsif s < 0
        sign = -1
    else
        sign = 0
    end

    seconds = created_at.to_i - 1134028003
    return (order + sign * seconds / 45000).to_i
   end

   def self.sorted_by_rank
  		Alarm.all.sort_by(&:rank).reverse
	end


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
