Exam::Application.routes.draw do
  resources :examinations

  resources :questions

  get "home/index"
  root :to=>"home#index"
  match "/questions/new/:type" => "questions#new"
  match "/start"  => "examinations#start",  :as => "start"
  match "/test"  => "examinations#test",  :as => "test"
  match "/q/:no(/:opt)" => "examinations#test"
  match "/finish" => "examinations#finish", :as => "finish"

  
end
