Rails.application.routes.draw do
  resources :drivers
  resources :cars
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'cars#index'
end
