Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


  post '/filter-resources', to: "warehouses#index", as: 'filter_index'
  resources :warehouses, only: [:show, :index, :new, :create, :edit, :update] do
    collection do
      get 'manage-your-space', to: "warehouses#manage_your_space"
    end
    resources :bookings, only: [:show, :index, :create]
  end

  get '/bookings/my_bookings/:id/cancel', to: "bookings#cancel", as: 'booking_cancel'

  resources :bookings, only: [] do
    collection do
      get 'my_bookings'
    end
  end

  patch 'bookings/approve', to: "bookings#approve"
  patch 'bookings/decline', to: "bookings#decline"

  # post 'cancel', to: 'bookings#cancel'
end
