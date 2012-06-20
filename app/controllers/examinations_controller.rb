class ExaminationsController < QuestionsController

	def test
	
		dic= {'a' => 'Physics', 'b' => 'Chemistry', 'c' => 'Biology'}
		@qa = Question.where(:qtype => dic['a']).shuffle[1..4]
		@qb = Question.where(:qtype => dic['b']).shuffle[1..3]
		@qc = Question.where(:qtype => dic['c']).shuffle[1..2]
		@quests = @qa + @qb + @qc
		
		@quests.each do |q|
			Examination.create( :question_id => q.id)
		end
		
		
		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @question }
		end
		
	end
	
	
	def start
		test()
	end
  
end
