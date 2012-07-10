class HomeController < ApplicationController
  def index
  end
  
  def set_locale
    I18n.locale = session[:lang] || I18n.default_locale
    { :locale => session[:lang] }
  end

  def lang
    session[:lang] = params[:locale]
    redirect_to request.env['HTTP_REFERER']
  end
end
