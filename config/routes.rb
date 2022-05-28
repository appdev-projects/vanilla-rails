Rails.application.routes.draw do
  root "games#index"
  
  resources :comments
  resources :votes
  resources :moves
  resources :games
  resources :pieces
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
