class LessonEventsController < ApplicationController
  before_action :require_login
  before_action :set_lesson_event
  before_action :set_score

  # PATCH/PUT /lesson_events/1 or /lesson_events/1.json
  def update
    respond_to do |format|
      if @study_session.update(lesson_event_params) == true && @study_session.status == "complete"
        format.html { redirect_to course_lesson_path({ course_id: @lesson_event.lesson.course_id }, { id: (@lesson_event.lesson.id + 1) }), notice: "Well done, friend." }
        format.json { render :show, status: :ok, location: @lesson_event.lesson_id }
      elsif @study_session.update(lesson_event_params) == true && @study_session.status != "complete"
        flash[:notice] = "Remember the nearness of the Sacred."
        format.js do
          render template: "lessons/show"
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson_event.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def lesson_event_params
    params.require(:lesson_event).permit(:seeker_id, :lesson_id, :status)
  end
end
