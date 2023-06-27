class LessonEventsController < ApplicationController
  before_action :require_login


  # PATCH/PUT /lesson_events/1 or /lesson_events/1.json
  def update

    @study_session = LessonEvent.find( params.fetch( :id ) )

    respond_to do |format|

      if @study_session.update(lesson_event_params) == true && @study_session.status == "complete"
        next_lesson = Lesson.find( @study_session.lesson_id + 1)
        format.html { redirect_to course_lesson_path( next_lesson.course, next_lesson), notice: "Well done, friend." }
        format.json { render :show, status: :ok, location: next_lesson }
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
