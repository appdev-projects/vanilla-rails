class RegistrationsController < Devise::RegistrationsController

  before_action :require_login, only: %i[ edit ]
  before_action :set_course, only: %i[ edit ]
  before_action :set_final_lesson, only: %i[ edit ]
  before_action :set_lesson, only: %i[ edit ]
  before_action :set_lesson_event, only: %i[ edit ]
  before_action :set_score, only: %i[ edit ]
  before_action :set_skr_sprtl_type, only: %i[ edit ]

  protected

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    course_lesson_path(course_id: 1, id: 15) if is_navigational_format?
  end

end
