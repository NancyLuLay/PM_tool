Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "static_pages#home"
  
  get "/" => "static_pages#home", as: :home

  get "/about" => "static_pages#about"

  resources :projects do
    resources :discussions, only: [:edit, :update, :index, :create, :destroy]
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :users, only: [:new, :create, :show, :edit, :update]
  get "users/:id/password" => "users#edit_password", as: :user_password
  patch "users/:id/password" => "users#update_password"

  resources :tasks

end
