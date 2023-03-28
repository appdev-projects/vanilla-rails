class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def welcome
    if signed_in?
      set_course
      set_lesson
      redirect_to(course_lesson_path(course_id: @course.id, id: @lesson.id))
    else
      resource = "seeker"
      render "welcome/index"
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

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(current_seeker.active_course_id)
  end

  # Use callbacks to share common setup or constraints between actions.

  def set_final_lesson
    current_syllabus = Lesson.all.where(course_id: @course.id)
    @final_lesson = current_syllabus.last
  end

  def set_lesson
    if current_seeker.complete_sessions.last == nil
      @lesson = Lesson.find_by({ course_id: @course.id, day: 1 })
    else
      @lesson = Lesson.find_by({ course_id: @course.id, id: current_seeker.complete_sessions.last.lesson_id + 1 })
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_lesson_event
    p current_seeker
    p seeker_signed_in?
    if current_seeker.complete_sessions.last == nil
      @study_session = LessonEvent.create({
        seeker_id: current_seeker.id,
        lesson_id: @lesson.id,
        status: 0,
      })
      @lesson_event = @study_session
      p @study_session
      p current_seeker
      p current_seeker.complete_sessions
      p current_seeker.complete_sessions.last
      p @lesson_event
    elsif current_seeker.complete_sessions.last.status = 3
      if @lesson != @final_lesson
        @study_session = LessonEvent.create({
          seeker_id: current_seeker.id,
          lesson_id: current_seeker.complete_sessions.last.lesson_id + 1,
          status: 0,
        })
        @lesson_event = @study_session
        p @study_session
        p current_seeker
        p current_seeker.complete_sessions
        p current_seeker.complete_sessions.last
        p current_seeker.complete_sessions.last.status
        p @lesson_event
      else
        @study_session = LessonEvent.create({
          seeker_id: current_seeker.id,
          lesson_id: current_seeker.complete_sessions.last.lesson_id,
          status: 0,
        })
        @lesson_event = @study_session

        p @study_session
        p @lesson_Event
      end
      # Find last LessonEvent
    else
      @study_session = current_seeker.complete_sessions.last

      @lesson_event = @study_session
      p @study_session
      p @lesson_event
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

  def set_skr_sprtl_type
    if @type_score.personalist != nil && @type_score.communalist != nil && @type_score.environmentalist != nil && @type_score.transcendentalist != nil
      scores = Array.new
      scores = [{ type: :personalist, score: @type_score.personalist }, { type: :communalist, score: @type_score.communalist }, { type: :environmentalist, score: @type_score.environmentalist }, { type: :transcendentalist, score: @type_score.transcendentalist }]

      @type_score.spiritual_type = scores.max_by { |k| k[:score] }[:type].to_s
      @type_score.save
    end
  end
end
