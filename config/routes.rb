Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :warehouses, only: [:show, :index, :new, :create] do
    resources :bookings, only: [:show, :index]
  end

  resources :bookings, only: [] do
    collection do
      get 'my_bookings'
    end
  end

end
