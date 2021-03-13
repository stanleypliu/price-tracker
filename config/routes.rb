Rails.application.routes.draw do
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :sites 

  get 'sites/:id/products', to: 'sites#fetch_products'
end
