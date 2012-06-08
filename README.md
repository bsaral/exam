## Yapılanlar

<li> yeni bir dal açıldı </li>

	git checkout -b login
	
<li> user adında bir tablomuz olduğunu var ve onun üzerinden ilerliyoruz. </li>

	1-)  $ rails generate migration add_role_to_users role:string
	
	2-)  vim db/migrate/XXXadd_role_to_users.rb  açılır 
	
		def change
			add_column :users, :role, :string, :default => "guest"
		end
		
	3-)  $ rake db:migrate
	
	4-)  vim app/models/user.rb  açılır 
	
		ROLES = %w[guest student editor juri admin]

		def role?(base_role)
			ROLES.index(base_role.to_s) <= ROLES.index(role)
		end
		
	5-)	  vim db/seeds.rb
		
		  User.create(:username => "author", :password => "12345", :password_confirmation => "12345", :role => "author")
		  
		  User.create(:username => "student", :password => "12345", :password_confirmation => "12345", :role => "student")
	
	
	















































































































































