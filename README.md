# Yapılanlar

## Cancan-Role

<li> yeni bir dal açıldı </li>

	git checkout -b login
	
<li> user adında bir tablomuz olduğunu var ve onun üzerinden ilerliyoruz. </li>

	1-)  $ rails generate migration add_role_to_users role:string
	
	2-)  $ rails g controller sessions new
	
	3-)  vim db/migrate/XXXadd_role_to_users.rb  açılır 
	
		def change
			add_column :users, :role, :string, :default => "guest"
		end
		
	4-)  $ rake db:migrate
	
	5-)  vim app/models/user.rb  açılır 
	
		ROLES = %w[guest student editor juri admin]

		def role?(base_role)
			ROLES.index(base_role.to_s) <= ROLES.index(role)
		end
		
	6-)	  vim db/seeds.rb
		
		  User.create(:username => "author", :password => "12345", :password_confirmation => "12345", :role => "author")
		  
		  User.create(:username => "student", :password => "12345", :password_confirmation => "12345", :role => "student")
		  
	7-)	  $ rake db:seed
	
	8-)	  app/models/ability.rb  adında yeni bir belge oluşturulur
	
		  vim app/models/ability.rb
		  
		  class Ability
			include CanCan::Ability

			  def initialize(user)
				user ||= User.new # guest user (not logged in)

				if user.role? :guest
				  # hiç bir şey yapamasın
				  # FIXME: sadece / görebilsin
				end

				if user.role? :student
				  # FIXME
				  # can :read, EQuestion
				end


				if user.role? :author
				  can :manage, User
				  can :manage, Question
				 
				end
			  end
			end	
		
		9-) vim/controller/sessions_controller.rb 
		
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
		
		10-) vim/app/controller/application_controller.rb
		
			rescue_from CanCan::AccessDenied do |exception|
				flash[:error] = "yeterli yetkiniz yok."
				redirect_to root_url
			  end
			  def current_user
				  session[:user_id] ? @current_user ||= User.find(session[:user_id]) : nil
			end
			
		11-) vim/app/helpers/sessions_helper.rb
		
			def current_user
				session[:user_id] ? @current_user ||= User.find(session[:user_id]) : nil 
			end
			
		12-)  vim/app/views/sessions/new.html.erb
		
			  <div class="container">
			  <div class="row">
				<div class="span8 offset2">
				  <%= form_tag sessions_path,:class=>"form-horizontal" do %>
				  <legend>Kullanıcı Girişi</legend>
					<% if flash[:error] %>
					  <div class="alert alert-error">
						<%= flash[:error] %>
					  </div>
					<% end %>
					<div class="control-group">
					  <label class="control-label">Kullanıcı Adınız</label>
				  <%= text_field_tag :username, params[:username] %>
					</div>
					<div class="control-group>">
					  <label class="control-label">Parola</label>
				  <%= password_field_tag :password %>
					</div>
					<%= submit_tag "Giriş Yap",:class =>"btn btn-primary" %>
				  <% end %>
				</div>
			  </div>
			</div>	
			
		bu kısım ayrıca views/home/index.html.erb içerisinede aktarılır

	
	
	















































































































































