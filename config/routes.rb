Rails.application.routes.draw do
  root "games#index"
  
  resources :comments
  resources :votes
  resources :moves#, only: [:index, :create, :delete, :update] <- need to update all of the routes to get rid of the routes we don't need. Also, confirm the action names (i think it's delete, but might be remove or destroy or something)
  resources :games
  resources :pieces
  devise_for :users
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
