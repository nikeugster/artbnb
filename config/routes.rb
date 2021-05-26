Rails.application.routes.draw do
  devise_for :users
  root to: 'arts#index'

  resources :arts do
    resources :bookings, only: [:create, :new]
  end

  get 'dashboard', to: 'pages#dashboard', as: :dashboard
end
