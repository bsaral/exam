class Examination < ActiveRecord::Base
  attr_accessible :question_id, :response, :user_id
  has_many :question
  validates_uniqueness_of :question_id
end
