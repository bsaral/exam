class UserSessionsController < ApplicationController
  before_filter :login_required, only: [ :destroy ]

  respond_to :html

  # omniauth callback method
  def create
    # auth: CLIENT:lib/josh_id.rb de sekillenir
    omniauth = env['omniauth.auth']
    logger.info { "\n\nDEBUG:Client:omniauth:  #{omniauth} X\n\n" }
    logger.info { "DEBUG:Client:raw_info:  #{omniauth.raw_info} X\n\n" }
    logger.info { "DEBUG:Client:info:  #{omniauth.info} X\n\n" }

    user = User.find_by_uid(omniauth['uid'])
    if not user
      # New user registration
    user = User.create!(uid: omniauth['uid'],
                        email: omniauth['info']['email'],
                        username: omniauth['info']['username'])
    end

    # Currently storing all the info
    session[:user_id] = omniauth

    flash[:notice] = "Successfully logged in"
    redirect_to root_path
  end

  # Omniauth failure callback
  def failure
    flash[:notice] = params[:message]
  end

  # logout - Clear our rack session BUT essentially redirect to the provider
  # to clean up the Devise session from there too !
  def destroy
    session[:user_id] = nil

    flash[:notice] = 'You have successfully signed out!'
    redirect_to "#{CUSTOM_PROVIDER_URL}/users/sign_out"
  end
end
