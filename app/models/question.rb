class Question < ActiveRecord::Base
  attr_accessible :description, :published, :question, :title, :type
end
