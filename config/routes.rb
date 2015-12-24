Rails.application.routes.draw do
  root to: 'pages#home'
  resources :users
  resources :homeworks
  resources :courses

  post '/sign_in', to: 'sessions#create'
end
