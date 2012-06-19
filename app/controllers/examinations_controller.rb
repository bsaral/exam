class ExaminationsController < QuestionsController

	def test
		@questions = Question.find(1)
		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @question }
		end
		
	end
	
	
	def start
		test()
	end
  
end
