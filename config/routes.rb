Rails.application.routes.draw do
  devise_for :users

  root 'books#home' 

  resources :books

  get 'home/about'=>'books#about' , as:'about'

  resources :users
  # , only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
