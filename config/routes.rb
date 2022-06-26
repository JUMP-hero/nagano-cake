Rails.application.routes.draw do
  
  namespace :admin do
    get 'orders/:id' => 'orders#show'
    patch 'orders/:id' => 'orders#update'
  end
  
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
