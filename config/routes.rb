Rails.application.routes.draw do

  namespace :admin do
    get '/' => 'homes#top'
  end

  scope module: :public do
    get 'customers' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
    patch 'customers' => 'customers#update'
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
