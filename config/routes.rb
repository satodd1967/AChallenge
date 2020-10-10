Rails.application.routes.draw do

  root "sessions#home"

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :challenges, only: [:show] do
    resources :challenge_goals, only: [:new]
  end

  resources :comments
  resources :logs
  resources :challenge_goals
  resources :challenges
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
