Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'login/login'
  resources :users, only: [:show, :create, :index] do
    collection do
      get :my_page
    end
  end
  resources :trains, only: [:create, :index, :show]
  resources :menus
end
