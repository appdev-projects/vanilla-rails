class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :require_login, except: %i[ welcome ]


  def welcome
    if signed_in? == false
      resource = "seeker"
      render "welcome/index"
    else
      @course = Course.find(current_seeker.active_course_id)
      @lesson = Lesson.find(current_seeker.active_lesson_id)

      redirect_to course_lesson_path(@course, @lesson)
    end
  end

  protected

  # def logged-in Seeker and Error Message
  def require_login
    unless signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to "/seekers/sign_up"
    end
  end

  def set_course
    @course = Course.find(current_seeker.active_course_id)
  end

  def set_lesson
    if current_seeker.lesson_events.last == nil
      @lesson = Lesson.find( current_seeker.active_lesson_id )
    elsif current_seeker.lesson_events.last.status == "complete"
      last_session = current_seeker.lesson_events.last
      @lesson = Lesson.find( last_session.lesson_id.to_i + 1)
    else
      last_session = current_seeker.lesson_events.last
      @lesson = Lesson.find( last_session.lesson_id.to_i)
    end
  end
    

  def set_lesson_event
    if current_seeker.lesson_events.last.status == "complete"

      @study_session = LessonEvent.create({
        seeker_id: current_seeker.id,
        lesson_id: @lesson.id,
        status: 0,
      })
    else
      @study_session = current_seeker.lesson_events.last
    end
  end

  # def current user's score
  def set_score
    if AssessmentScore.find_by(seeker_id: current_seeker.id) == nil
      @type_score = AssessmentScore.create({
        seeker_id: current_seeker.id,
      })   
    else
      @type_score = AssessmentScore.find_by(seeker_id: current_seeker)
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :phone_number, :password, :active_course_id, :active_lesson_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :first_name, :phone_number, :password, :active_course_id, :active_lesson_id])
  end
end
