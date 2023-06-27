# frozen_string_literal: true

class Registrations::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :set_course, except: %i[ create edit update destroy ]
  before_action :set_lesson, except: %i[ create edit update destroy ]

  before_action :require_login,       only: %i[ edit update destroy ]


    # PUT /resource
    def update
      if params[:seeker][:password].blank? && params[:seeker][:password_confirmation].blank?
        params[:seeker].delete(:password)
       params[:seeker].delete(:password_confirmation)
      end
      current_seeker.active_course_id = params[:seeker][:active_course_id]
      current_seeker.active_lesson_id = Lesson.find_by( course_id: params[:seeker][:active_course_id], day: 1).id
      current_seeker.save

      @active_course = Course.find(current_seeker.active_course_id)
      @active_lesson = Lesson.find( current_seeker.active_lesson_id )

      @study_session = LessonEvent.create(
        seeker_id: current_seeker.id,
        status: 0,
        lesson_id: @active_lesson.id
      )

      redirect_to course_lesson_path(@active_course, @active_lesson)
      
    end

  protected

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    courses_path if is_navigational_format?
  end
  
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end



  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
