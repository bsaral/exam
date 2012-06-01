class User < ActiveRecord::Base
	attr_accessible :name, :surname, :email, :password
end
