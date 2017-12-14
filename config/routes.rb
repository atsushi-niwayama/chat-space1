Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'messages#index'
  get '/messages' => 'messages#index'
  resources :groups, only: [:new, :create, :edit, :update]
  resources :group_users,  only: [:create, :edit]
  resources :users, only: [:create, :edit]
end
