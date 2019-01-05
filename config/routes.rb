Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'runners#new'

  resources :runners do
    resources :runs
  end

  resources :runs
  resources :events
  resources :runner_events

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  get '/auth/github/callback' => 'sessions#create'
end
