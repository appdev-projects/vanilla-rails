class RegistrationsController < Devise::RegistrationsController
  before_action :set_course, only: %i[ show edit update destroy ], except: %i[welcome]
  before_action :set_final_lesson, except: %i[welcome new]
  before_action :set_lesson, only: %i[ show edit update destroy ], except: %i[welcome new]
  before_action :set_lesson_event, only: %i[ show edit update destroy new], except: %i[welcome new]
  before_action :set_score, except: %i[welcome new]
  before_action :set_skr_sprtl_type, except: %i[welcome new]

  def welcome
    resource = "seeker"
    render "welcome/index"
  end

  def new
  end

  protected

end
