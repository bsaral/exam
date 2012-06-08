class SessionsController < ApplicationController
  def new
    redirect_to deneme_index_path if session[:user_id]
  end
  
  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      case user.role
      when "student"
        redirect_to deneme_index_path
      when "author"
        redirect_to deneme_index_path
      end
    else
      flash[:error] = "Kullanici adin ve/veya parolan hatali"
      redirect_to home_index_path
      
    end
  end
 
  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
