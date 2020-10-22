Rails.application.routes.draw do

  resources :log_scores
  root "sessions#home"

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/auth/facebook/callback' => 'sessions#fblogin'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :challenges

  resources :challenges, only: [] do
    resources :challenge_goals, only: [:new, :create]
  end

  resources :logs
  resources :challenge_goals
  resources :users

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
