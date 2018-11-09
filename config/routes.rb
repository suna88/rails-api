Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :users, only: [:show]
  resources :trains, only: [:create, :index, :show, :delete]
  resources :menus, only: [:create, :index, :show]
end
