Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :experiences, only: [:new, :create]
end
