class LessonsController < ApplicationController
  before_action :require_login
  before_action :set_course, only: %i[ show export ]
  before_action :set_lesson, only: %i[ show export ]
  before_action :set_lesson_event, only: %i[ show ]
  before_action :set_score, only: %i[ show ]
  


  # GET /lessons/1 or /lessons/1.json
  def show
      # Define Content Links
      @teaching_link = "teaching_content/course_" + @course.id.to_s + "/lesson_" + (@lesson.day.to_i).to_s
      @practice_link = "practice_content/course_" + @course.id.to_s + "/lesson_" + (@lesson.day.to_i).to_s
  end

  def export
    lessons = Lesson.all
      
      respond_to do |format|
        format.html do
          render
        end
        format.csv do
           send_data(lessons.to_csv, { :filename =>  "export_lessons.csv"} )
        end
      end
  end

  private

  # Only allow a list of trusted parameters through.
  def lesson_params
    params.fetch(:lesson, {})
  end
end
