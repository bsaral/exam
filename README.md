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
			 expiryUrl: location.protocol + '//' + location.host + '/finish_ex/'
			 
	3-) app/assets/stylesheets/
	
		jquery.countdown.css
		
		
		examinations.css.scss
		
			@import "jquery.countdown.css";
			
	4-) app/views/examinations/test.html.erb
	
		<script type="text/javascript">
			var austDay = new Date( <%= @time_finish.to_i * 1000 %> );

			function otherFun(response) {
					$('input[id=response_id]').val(response);

					$('#target').submit();
			}
		</script>
		
		....
		
		<div style="position:absolute;top:100px;left:750px;">
			<div id="clock" style="width: 240px; height: 45px;"></div>
		</div>
		
	5-) app/controllers/examinations_controller.rb
	 
		def test
		
			....
			
			@time_start   = Time.now
			@time_finish = @time_start + 5.minutes
			
		def finish_ex

		end
	 
	6-) app/views/examinations/finish_ex.html.slim
	 
		div class="hero-unit" style="height:100px;width:850px;position:absolute;top:150px;left:200px;"

		h1 SINAV SÜRENİZ SONA ERDİ
		
		= button_to 'Sonucumu Göster', { action: "rapor", format: "pdf" }, class: 'btn btn-large btn-success', style: "position:absolute;top:150px;left:350px;"
		
	7-) config/routes.rb
	 
		match "/finish" => "examinations#finish", :as => "finish"
		match "/finish_ex" => "examinations#finish_ex", :as => "finish_ex"
		
	
			
	
		
		
```
		
		
		


















































































































































