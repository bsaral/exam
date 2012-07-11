# YAPILMASI GEREKENLER
	
	
	$ git clone https://github.com/bsaral/exam.git
	$ git checkout -b lang
	$ git pull origin lang
	$ bundle
	$ rake db:migrate
	$ rake db:seed
	$ rails s 
	
	
# YAPILANLAR

	1- Gemfile
	
	    gem 'rails-i18n'
		
	2- app/controllers/application_controller.rb
	
		before_filter :set_locale
   
		  def set_locale
			  I18n.locale = params[:locale] || I18n.default_locale
		  end

		  def default_url_options(options={})
			  logger.debug "default_url_options is passed options: #{options.inspect}\n"
			  { locale: I18n.locale }
			  
	3- app/controllers/home_controller.rb
	
		def set_locale
			I18n.locale = session[:lang] || I18n.default_locale
			{ :locale => session[:lang] }
		end

		def lang
			session[:lang] = params[:locale]
			redirect_to request.env['HTTP_REFERER']
		end
		
	4- app/views/layouts/application.html.erb
	
	   <% if current_user %>
        <li><%= link_to current_user.username,"" %></li>
        <li><%= link_to "Çıkış",logout_url %> </li>
       <% end %>
       <% unless session[:admin] %>
         <li class="dropdown">
         <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%= t 'home.languages' %><b class="caret"></b></a>
         <ul class="dropdown-menu">
			  <li><a href="/lang/tr">Türkçe</a></li>
			  <li class="divider"></li>
			  <li><a href="/lang/en">English</a></li>
			  <li><a href="/lang/ru">Русский</a></li>
        </ul>
        </li>
       <% end %>
       
     5- config/application.rb
     
		config.i18n.default_locale = :en
		I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')]
		config.i18n.available_locales = [:en, :tr]
		
	
	 6- config/locales/en.yml
	 
		en:
		  basic: "Online Examination System"
		  test: "A simple test system was prepared for trial"
		  user: "Login"
		  user_name: "User Name"
		  password: "Password"
		  enter: "Login"
	 
	 7- config/locales/tr.yml
	 
		tr:
		  basic: "Online Sınav Sistemi"
		  test: "Deneme amaçlı hazırlanmış basit bir sınav sistemidir"
		  login: "Kullanıcı Girişi"
		  user_name: "Kullanıcı Adınız"
		  password: "Parola"
		  enter: "Giriş Yap"
		  
	 8- config/routes.rb
	 
		match "lang/:locale" => "home#lang" 
		
	 9- app/views/home/index.html.erb
	 
		<h2 align= "center" style= "color:green"><%= t 'basic' %></h2></br>
		<p align= "center"><%= t 'test' %> </p>
		
		.....
		
		
		


















































































































































