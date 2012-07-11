class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "yeterli yetkiniz yok."
    redirect_to root_url
  end
  def current_user
      session[:user_id] ? @current_user ||= User.find(session[:user_id]) : nil
  end
  def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
      logger.debug "default_url_options is passed options: #{options.inspect}\n"
      { locale: I18n.locale }
  end
end
