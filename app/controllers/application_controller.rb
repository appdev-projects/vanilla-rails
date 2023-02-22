class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # def logged-in Seeker and Error Message
  def require_login
    unless signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to seeker_session_path # halts request cycle
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    if current_seeker.last_session == nil
      @course = Course.find(1)
    else
      @course = Course.find_by(:id => params.fetch("course_id"))
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_lesson
    if current_seeker.last_session == nil
      @course = Course.find(1)
      @lesson = Lesson.find_by({ course_id: @course, day: 1 })
    else
      @course = Course.find_by(:id => params.fetch("course_id"))
      @lesson = Lesson.find_by({ course: @course, day: params.fetch(:id) })
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_lesson_event
    if current_seeker.previous_lesson == nil
      @study_session = LessonEvent.create({
        seeker_id: current_seeker.id,
        lesson_id: @lesson.id,
        status: 0
      })
      @lesson_event = @study_session 
    else

      # Create New LessonEvent
      @study_session = LessonEvent.create({
        seeker_id: current_seeker.id,
        lesson_id: Lesson.find(params.fetch("id")),
        status: 0 
        })
      @lesson_event = @study_session 
    end
  end

  # def current user's score
  def set_score
    if current_seeker.type_score == nil
      @type_score = AssessmentScore.create({
        seeker_id: current_seeker.id,
      })
    else
      @type_score = current_seeker.type_score
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
  end
end
