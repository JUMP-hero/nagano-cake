Rails.application.routes.draw do


  scope module: :public do
    get 'cart_items/index' => 'cart_items#index'
    post 'cart_items' => 'cart_items#create'
    delete 'cart_items/all' => 'cart_items#destroy_all'
    delete 'cart_items/:id' => 'cart_items#destroy', as: 'destroy_cart_item'
    patch 'cart_item_params/:id' => 'cart_items#update', as: 'update_cart_item'
  end




  scope module: :public do
    resources :items, only: [:index, :show]
  end

  namespace :admin do
    get '/' => 'homes#top'
  end

  scope module: :public do
    get 'customers' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
    patch 'customers' => 'customers#update'
    resources :addresses, only: [:index, :create, :destroy, :edit, :update]
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        get :confirm
        get :complete
      end
    end
  end


  scope module: :public do
    root to: "homes#top"
    get '/about' => 'homes#about', as: 'about'
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
    resources :genres, only: [:index, :create, :edit, :update]

   resources :items, only: [:index, :new, :create, :show, :edit, :update]
   
   resources :orders, only: [:show, :update]

  end



  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
      resource :order_items, only: [:update]
  end
end
