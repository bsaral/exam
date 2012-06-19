class ExaminationController < ApplicationController
	def soru
		@question = Question.find(params[:id])

		
	end


end
