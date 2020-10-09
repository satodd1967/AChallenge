Rails.application.routes.draw do

  resources :comments
  root "sessions#home"

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
  resources :logs
  resources :challenge_goals
  resources :challenges
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
