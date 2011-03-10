class Group < ActiveRecord::Base

	has_many :memberships
	belongs_to :user
	def users
		users = []
		memberships.each do | membership |
			users << User.find_by_id(membership.user_id)
		end
		return users
	end
	
	def runs
		runs = []
		users.each do |user|
			user.runs.each do |run|
				runs << run
			end
		end
		return runs
	end
end
