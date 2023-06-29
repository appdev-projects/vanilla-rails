class CoursesController < ApplicationController
  before_action :require_login
  before_action :set_course, only: %i[ index ]
  before_action :set_lesson, only: %i[ index ]
  

  # Action for data exports

  def export
    courses = Course.all
      
      respond_to do |format|
        format.html do
          render
        end
        format.csv do
           send_data(courses.to_csv, { :filename =>  "export_courses.csv"} )
        end
      end
  end

  def index
  end




end
