class RegistrationsController < Devise::RegistrationsController

  protected

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    course_lesson_path(course_id: 1, id: 15) if is_navigational_format?
  end
end
