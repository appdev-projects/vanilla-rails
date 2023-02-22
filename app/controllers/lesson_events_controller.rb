class LessonEventsController < ApplicationController
  before_action :require_login
  before_action :set_course, only: %i[ show edit update destroy]
  before_action :set_lesson, only: %i[ show edit update destroy ]
  before_action :set_lesson_event, only: %i[ show edit update destroy ]

  # GET /lesson_events or /lesson_events.json
  def index
    @lesson_events = LessonEvent.all
  end

  # GET /lesson_events/1 or /lesson_events/1.json
  def show
  end

  # GET /lesson_events/new
  def new
    @lesson_event = LessonEvent.new
  end

  # GET /lesson_events/1/edit
  def edit
  end

  # POST /lesson_events or /lesson_events.json
  def create
    @lesson_event = LessonEvent.new(lesson_event_params)

    respond_to do |format|
      if @lesson_event.save
        format.html { redirect_to lesson_event_url(@lesson_event.lesson_id), notice: "Lesson event was successfully created." }
        format.json { render :show, status: :created, location: @lesson_event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lesson_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lesson_events/1 or /lesson_events/1.json
  def update
    respond_to do |format|
      if @lesson_event.update(lesson_event_params) && @lesson_event.status == "complete"
        format.html { redirect_to course_lesson_path({ course_id: @lesson_event.lesson.course_id, id: Lesson.find_by( id: @lesson_event.lesson_id + 1)}), notice: "Well done, friend." }
        format.js do
          render template: "lessons/show.js.erb"
        end
        format.json { render :show, status: :ok, location: @lesson_event.lesson_id }
      elsif @lesson_event.update(lesson_event_params) && @lesson_event.status != "complete"
        format.html { redirect_back fallback_location: course_lesson_url({ course_id: @lesson_event.lesson.course_id, id: Lesson.find_by( id: @lesson_event.lesson_id)}), notice: "One step closer to the Sacred." }
        format.json { render :show, status: :ok, location: @lesson_event.lesson_id }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesson_events/1 or /lesson_events/1.json
  def destroy
    @lesson_event.destroy

    respond_to do |format|
      format.html { redirect_to lesson_events_url, notice: "Lesson event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private


    # Only allow a list of trusted parameters through.
    def lesson_event_params
      params.require(:lesson_event).permit(:seeker_id, :lesson_id, :status)
    end
end
