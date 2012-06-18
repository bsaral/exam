class Question < ActiveRecord::Base
  attr_accessible :answer, :qtype, :question, :title, :answers_attributes
  has_many :answers , :dependent => :destroy
  accepts_nested_attributes_for :answers,:reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  
  
	
end
