class ExaminationsController < QuestionsController

	def test
	
		@qa = Question.where(:qtype => 'a').shuffle[1..5]
		@qb = Question.where(:qtype => 'b').shuffle[1..3]
		@qc = Question.where(:qtype => 'c').shuffle[1..2]
		@quests = @qa + @qb + @qc
		
		@quests.each do |q|
			Examination.create( :question_id => q.id)
		end
		@no = params[:no].to_i
		
		if @no == 10 
			redirect_to ("/finish")
		end
		
		
		
		
	end
	
	
	def start
	
		test()
	end
	
	def finish
		
		
		
			
	end
			
			
	
  
end
