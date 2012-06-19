class Examination < ActiveRecord::Base
  attr_accessible :question_id, :response, :user_id
  has_many :question
end
