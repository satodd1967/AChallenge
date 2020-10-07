Rails.application.routes.draw do

  root "static#home"

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
  resources :logs
  resources :challenge_goals
  # resources :challenge_users
  resources :challenges
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
