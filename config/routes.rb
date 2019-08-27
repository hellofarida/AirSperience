Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :experiences, only: [:index, :show, :new, :create, :destroy] do
    resources :bookings, only: [:create]
  end

end
