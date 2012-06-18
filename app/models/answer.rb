class Answer < ActiveRecord::Base
  attr_accessible :question_id , :content
  belongs_to :question	
  
end
