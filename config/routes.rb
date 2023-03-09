Rails.application.routes.draw do
  root 'tasks#index' 
  resources :tasks
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get ":username/feed" => "users#feed", as: :feed
end
