class SessionsController < ApplicationController
  def new
    redirect_to root_url if session[:user_id]
  end
  
  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if params[:username] == "author"
		redirect_to ('/questions') 
	  else
		redirect_to ('/start')
	  end
		
    else
      flash[:error] = "Kullanici adin ve/veya parolan hatali"
      render "new"
    end
  end
 
  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
