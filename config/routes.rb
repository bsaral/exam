Exam::Application.routes.draw do
  resources :questions

  get "home/index"
  root :to=>"home#index"
  match "/questions/new/:type" => "questions#new"
  match "/start"  => "examination#start",  :as => "start"
  match "/soru"  => "examination#soru",  :as => "soru"
  


end
