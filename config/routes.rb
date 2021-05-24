Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :arts do
    resources :bookings, only: [:create, :new]
  end

  get 'dashboard', to: 'pages#dashboard', as: :dashboard

#  / GET pages home

#   /arts/new GET arts  new
#   /arts POST  arts  create
#   /arts GET arts  index
#   /arts/:id/bookings/new  GET offers  new
#   /arts/:id/bookings  POST  offers  create
#   /users/:id/bookings GET users index
#   /users/:id/bookings/:id GET users show


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
