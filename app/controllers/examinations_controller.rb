class ExaminationsController < QuestionsController

	def test
	
		@qa = Question.where(:qtype => 'a').shuffle[1..5]
		@qb = Question.where(:qtype => 'b').shuffle[1..3]
		@qc = Question.where(:qtype => 'c').shuffle[1..2]
		@quests = @qa + @qb + @qc
		
		@opt = params[:opt].to_s
		@no = params[:no].to_i
		@find = Examination.find_by_id(@no)
		
		if @find == nil 
			Examination.create(:question_id => @no , :response => @opt)
		end
		
		
		
		if @no == 10 
			redirect_to ("/finish")
		end
		
		@time_start   = Time.now
		@time_finish = @time_start + 5.minutes
		
		
		
		
	end
	
	
	def start
	
		test()
		
	end
	
	def finish	
		e = ExamInfo.find_by_user_id(session[:user_id])
		e.time_finish_student = Time.now
		e.save
			
	end
	
	
	def finish_expire
		flash[:error] = "Verilen surede sinavi tamamlayamadiniz"

		render 'finish'
	end
	
	def rapor
	
		@examinations = Examination.all
		test()
		
		respond_to do |format|
		  format.html # show.html.erb
		  format.json { render json: @examinations }
		  format.pdf { render :layout => false }
		end
		
	end
			
			
	
  
end
