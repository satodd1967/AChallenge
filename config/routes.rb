Rails.application.routes.draw do

  root "sessions#home"

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :challenges

  resources :challenges, only: [] do
    resources :challenge_goals, only: [:new, :create]
  end

  resources :comments
  resources :logs
  resources :challenge_goals
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
