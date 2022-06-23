Rails.application.routes.draw do
  resources :orders, only: [:new, :create, :index, :show] do
          # ルート修正
          collection do
            get :confirm
            get :complete
          end
        end
  namespace :admin do
  get 'genres/index' => 'genres#index'
  get 'genres/:id/edit' => 'genres#edit', as: 'edit_genre'
  post 'genres' => 'genres#create'
  patch 'genres/:id' => 'genres#update', as: 'update_genre'
  end

  devise_for :users
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
