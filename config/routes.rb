Rails.application.routes.draw do
  root "menus#top"
  get "home/about" => "menus#about"
  devise_for :users

  resources :users, only: [:show, :index, :edit, :update]
  resources :books, only: [:index, :create, :edit, :update, :destroy, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
