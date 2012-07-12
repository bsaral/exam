class ExamInfo < ActiveRecord::Base
  attr_accessible :exam_id, :time_finish, :time_finish_student, :time_start, :user_id
  belongs_to :user
end
