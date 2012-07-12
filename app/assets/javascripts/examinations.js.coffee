# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->

	 $('#clock').countdown
		 format: 'MS'
		 until: austDay  #<%= @time_finish %>
		 expiryUrl: location.protocol + '//' + location.host + '/finish/'
