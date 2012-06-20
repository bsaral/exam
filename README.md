# YAPILANLAR

##1-) CKEDITOR INSTALL

	1-) vim Gemfile
	
		gem 'ckeditor', '3.4.2.pre'
		
	2-) $ bundle install
	
	3-) $ rails generate ckeditor:base
	
	4-) $ rails generate ckeditor:migration
	
	5-) $ rake db:migrate
	
	6-) vim config/application.rb 
	
		config.autoload_paths += %W( #{config.root}/app/models/ckeditor )
		
	7-) vim app/views/layouts/application.html.erb
	
		<%= javascript_include_tag "/javascripts/ckeditor/ckeditor.js" %>
		
	8-) vim app/views/questions/_form.html.erb
	
		<%= f.cktext_area :question,:toolbar => "Full",:class => 'span5',:height=>'300px'  %>
	
	9-) vim app/views/questions/show.html.erb
	
		<p>
			<b>Question:</b>
				<%= @question.question %>
		</p>
		
		olan kısmı aşağıdaki gibi değiştiriyoruz.
		
		<p>
			<b>Question:</b>
				<%= simple_format(@question.question) %>
		</p>
		
FIXME Image upload

## YAPILMASI GEREKENLER

	$ git clone https://github.com/bsaral/exam.git
	$ git checkout -b author
	$ git pull origin author
	$ bundle
	$ rake db:migrate
	$ rake db:seed
	$ rails s 
		
		
	
		















































































































































