class Question < ActiveRecord::Base
  attr_accessible :description, :published, :question, :title, :type
  has_and_belongs_to_many :authors, class_name: 'User', join_table: 'users_questions', association_foreign_key: 'user_id'
end
