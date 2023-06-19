class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :require_login, except: %i[ welcome ]
  before_action :set_course, except: %i[ welcome ]
  before_action :set_lesson, except: %i[ welcome ]

  def welcome
    if signed_in? == false
      resource = "seeker"
      render "welcome/index"
    else 
      @course = Course.find(1)
      @lesson = Lesson.find(1)
    end
      
      redirect_to course_lesson_path(@course.id, @lesson.id)
  
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
    @course = Course.find(1)
  end


  def set_lesson
    @lesson = Lesson.find(1)
  end

  def set_lesson_event
      @study_session = LessonEvent.create({
        seeker_id: current_seeker.id,
        lesson_id: @lesson.id,
        status: 0,
      })
      @lesson_event = @study_session
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
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :phone_number, :password, :active_course_id])
  end

  def set_skr_sprtl_type
    if @type_score.personalist != nil && @type_score.communalist != nil && @type_score.environmentalist != nil && @type_score.transcendentalist != nil 
    scores = Array.new
    scores = [{type: :personalist, score: @type_score.personalist}, { type: :communalist, score:  @type_score.communalist},{ type: :environmentalist, score:  @type_score.environmentalist},{ type: :transcendentalist, score:  @type_score.transcendentalist} ]

    @type_score.spiritual_type = scores.max_by{|k| k[:score] }[:type].to_s
    @type_score.save
    end
  end

end
