Rails.application.routes.draw do

  scope module: :public do
    resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdraw]
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw'
  end


  scope module: :public do
    root to: "homes#top"
    get 'homes/about'
  end

devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:passwords] ,controllers: {
  registrations: "admin/registrations",
  sessions: "admin/sessions"
}

  namespace :admin do
  get 'genres' => 'genres#index'
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

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
