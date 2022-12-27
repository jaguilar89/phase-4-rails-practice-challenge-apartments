Rails.application.routes.draw do
  #resources :leases, only: [:index]
  #resources :tenants
  resources :apartments, only: [:index, :show, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
