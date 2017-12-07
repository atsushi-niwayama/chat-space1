Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'messages#index'
  get '/messages' => 'messages#index'
  # get '/users/edit' => 'users#edit'
  # get '/users/delete' => 'users#delete'
end
