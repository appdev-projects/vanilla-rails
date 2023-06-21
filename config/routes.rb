# == Route Map
#

Rails.application.routes.draw do

  root "application#welcome"

  resources :lesson_events
  resources :assessment_scores
  devise_for :seekers, controllers: { registrations: "registrations/registrations" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :courses do
    resources :lessons
  end

  devise_scope :seeker do
  get "/welcome/index", to: "registrations#welcome"
  end

  #data to csv export routes
  get("/export_courses", { :controller => "courses", :action => "export" })
  get("/export_lessons", { :controller => "lessons", :action => "export" })
  get("/export_aq", { :controller => "assessment_questions", :action => "export" })
  get("/export_as", { :controller => "assessment_scores", :action => "export" })

end
