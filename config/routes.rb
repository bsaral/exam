Exam::Application.routes.draw do
  get "sessions/new"
  resources :sessions, only: [:new, :create, :destroy]
  match "login" => "sessions#new",:as => "login"
  match "logout" => "sessions#destroy"

  resources :examinations

  resources :questions

  get "home/index"
  match "home" => "home#index"
  match "lang/:locale" => "home#lang" 
  match "/author" => "home#author",:as => "author"
  root :to=>"home#index"
  match "/questions" => "questions#index"
  match "/questions/new/:type" => "questions#new"
  match "/start"  => "examinations#start",  :as => "start"
  match "/test"  => "examinations#test",  :as => "test"
  match "/q/:no(/:opt)" => "examinations#test"
  match "/finish" => "examinations#finish", :as => "finish"
  match "/rapor" => "examinations#rapor", :as => "rapor"

  
end
