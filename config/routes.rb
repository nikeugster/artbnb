Rails.application.routes.draw do
  devise_for :users
  root to: 'arts#index'

  resources :arts do
    resources :bookings, only: [:create, :new]
  end

  resources :bookings, only: [:destroy]

  get 'bookings/:id', to: 'bookings#accept'
  patch 'bookings/:id', to: 'bookings#accept', as: :booking_accept
  get 'dashboard', to: 'pages#dashboard', as: :dashboard
end
