class User < ActiveRecord::Base
	belongs_to :institution
	attr_accessible :name, :surname, :email, :password
	validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
	validates :name , :presence => true
	validates :surname , :presence => true
	validates :email , :uniqueness => true
	has_and_belongs_to_many :questions, :join_table => 'users_questions', :foreign_key => 'user_id'
	has_secure_password
end
