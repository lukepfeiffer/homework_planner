Rails.application.routes.draw do
  root to: 'pages#home'
  resources :users
  resources :assignments
  resources :courses

  post '/sign_in', to: 'sessions#create'

  delete '/sign_out', to: 'sessions#destroy'
end
