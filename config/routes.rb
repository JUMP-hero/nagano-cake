Rails.application.routes.draw do

  resources :addresses, only: [:index, :create, :destroy, :edit, :update]
  resources :items

  namespace :admin do
  get 'genres/index' => 'genres#index'
  get 'genres/:id/edit' => 'genres#edit', as: 'edit_genre'
  post 'genres' => 'genres#create'
  patch 'genres/:id' => 'genres#update', as: 'update_genre'

  get 'items/index' => 'items#index'
  get 'items/new' => 'items#new'
  post 'items' => 'items#create'
  get 'items/:id' => 'items#show', as: 'show_item'
  get 'items/:id/edit' => 'items#edit', as: 'edit_item'
  patch 'items/:id' => 'items#update', as: 'update_item'

  end

  devise_for :users
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
