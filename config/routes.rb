Rails.application.routes.draw do

  root "application#welcome"

  resources :lesson_events
  resources :assessment_scores
  devise_for :seekers, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :courses do
    resources :lessons
  end

  devise_scope :seeker do
  get "/welcome/index", to: "registrations#welcome"
  end

  devise_scope :seeker do
    get "/seeker/sign_up", to: "registrations#welcome"
    end
end
