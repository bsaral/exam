# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:id => 0 ,:username => "author", :password => "12345", :password_confirmation => "12345", :role => "author")
User.create(:id => 1,:username => "student", :password => "12345", :password_confirmation => "12345", :role => "student")
User.create(:id => 2,:username => "bsaral", :password => "bsaral", :password_confirmation => "bsaral")

