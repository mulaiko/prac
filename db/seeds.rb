# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
my_test_user = User.new(name: Faker::Internet.username, 
				email: 'pop@pop.com', 
				password: 'pop123', 
				bio: Faker::Lorem.sentence)
my_test_user.skip_confirmation!
my_test_user.save

10.times do |num|
	user = User.new(name: Faker::Internet.username, 
							email: "#{num}@pop.com", 
							password: 'pop123', 
							bio: Faker::Lorem.sentence )
	user.skip_confirmation!
	user.save
end

#User.all.each do |user|
	#user.posts.create([{content: Faker::SiliconValley.quote}, {content: Faker::SiliconValley.quote}, {content: Faker::SiliconValley.quote}, {content: Faker::SiliconValley.quote}, {content: Faker::SiliconValley.quote}]) 
	#user.follow(User.where.not(id: user).order("RANDOM()").first)	
#end