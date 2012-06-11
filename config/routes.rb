Exam::Application.routes.draw do
  resources :questions

  get "home/index"

  root :to => "home#index" 
  
end
