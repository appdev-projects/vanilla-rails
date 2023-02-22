Rails.application.routes.draw do

  root "lessons#show"

  
  resources :assessment_scores
  devise_for :seekers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :courses do
    resources :lessons
  end

  

  resources :lesson_events
end
