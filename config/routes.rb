Rails.application.routes.draw do
  root to: 'pages#home'
  resources :users
  resources :assignments
  resources :courses

  post '/sign_in', to: 'sessions#create'

  delete '/unarchive', to: 'assignments#unarchive'
  delete '/sign_out', to: 'sessions#destroy'
end
