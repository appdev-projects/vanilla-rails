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
    @course = Course.find(current_seeker.active_course_id)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_lesson
    if current_seeker.last_session == nil
      @lesson = Lesson.find_by({ course_id: @course.id, day: 1 })
    else
      @lesson = Lesson.find_by({ course_id: @course.id, id: current_seeker.last_session.lesson_id + 1 })
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_lesson_event
    if current_seeker.last_session == nil
      @study_session = LessonEvent.create({
        seeker_id: current_seeker.id,
        lesson_id: @lesson.id,
        status: 0,
      })
      @lesson_event = @study_session
    elsif current_seeker.last_session.status = 3
      @study_session = LessonEvent.create({
        seeker_id: current_seeker.id,
        lesson_id: current_seeker.last_session.lesson_id + 1,
        status: 0,
      })
      @lesson_event = @study_session

      # Find last LessonEvent
    else
      @study_session = current_seeker.last_session

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
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :active_course_id])
  end
end
