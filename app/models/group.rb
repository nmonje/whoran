class Group < ActiveRecord::Base

	has_many :memberships
	
	def users = 
		users = []
		Group.memberships.each do | membership |
			users << User.find_by_id(membership.user_id)
		end
	end

end
