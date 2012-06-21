# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(0..10).each do |i|
		q = Question.new(
			:title 		=> "Soru-" + sprintf("%02d", i+1),
			:qtype 		=> "aaaaabbbcc"[i % 10],
			:question 	=> "<p> Soru ? </p> ",
			:answer 	=> ["A", "B", "C", "D", "A", "B", "C", "D", "A", "B"][i % 10]
                      
		)
		(0..3).each do |j|
				q.answers.build(:content => ["AAA", "BBB", "CCC", "DDD"][j])
		end 
		
		q.save
end


User.create(:username => "student", :password => "1234", :password_confirmation => "1234", :role => "student")
User.create(:username => "author", :password => "1234", :password_confirmation => "1234", :role => "author")
User.create(:username => "bsaral", :password => "1234", :password_confirmation => "1234", :role => "student")
