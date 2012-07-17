# YAPILMASI GEREKENLER
	
	
	$ git clone https://github.com/bsaral/exam.git
	$ git checkout -b clock
	$ git pull origin clock
	$ bundle
	$ rake db:migrate
	$ rake db:seed
	$ rails s 
	
	
# YAPILANLAR

```ruby

	1-) app/assets/javascripts
	
		countdownBasic.html
		jquery.countdown-tr.js
		jquery.countdown.js
		
	2-) app/assets/javascripts/examinations.js.coffee
	
		jQuery ->

		 $('#clock').countdown
			 format: 'MS'
			 until: austDay  #<%= @time_finish %>
			 expiryUrl: location.protocol + '//' + location.host + '/finish/'
	
		
		
```
		
		
		


















































































































































