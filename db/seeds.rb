User.delete_all
Run.delete_all
Group.delete_all

User.create(:email => 'ex@mp.le', :username => 'example', :password => 'example')

example = User.find_by_username('example')

Run.create(:user_id => example.id,
						:date => Date.today,
						:time => Time.now,
						:distance => 2.5)

Group.create(:user_id => example.id,
							:title => 'The Examples',
							:description => 'For all the examples in the world.')

the_examples = Group.find_by_title('The Examples')

Membership.create(:user_id => example.id,
									:group_id => the_examples.id)
