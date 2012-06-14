class Question < ActiveRecord::Base
  attr_accessible :answer, :qtype, :question, :title
end
