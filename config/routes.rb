Rails.application.routes.draw do
  resources :lesson_events
  resources :assessment_questions
  resources :lessons
  resources :courses
  devise_for :seekers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
