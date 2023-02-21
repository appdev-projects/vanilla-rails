Rails.application.routes.draw do
  resources :assessment_scores
  devise_for :seekers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :lessons
  root "lessons#show"

  resources :lesson_events
end
