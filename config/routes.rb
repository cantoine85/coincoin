Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :managers, only: [] do
    resources :bookings, only: [:index, :create]
  end
end
