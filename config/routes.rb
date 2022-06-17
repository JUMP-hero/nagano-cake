Rails.application.routes.draw do
  get 'genres/index'
  get 'genres/edit'
  post 'genres' => 'genres#create'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
