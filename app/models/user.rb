class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	
	
  # Setup accessible (or protected) attributes for your model
	has_many :runs
	has_many :memberships
	has_many :groups
	
	def groups
		groups = []
		memberships.each do | membership |
			groups << Group.find_by_id(membership.group_id)
		end
		return groups
	end
	attr_accessible :email, :password, :password_confirmation, :remember_me, :username
end
