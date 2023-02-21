class LessonsController < ApplicationController
  before_action :require_login
  before_action :set_lesson, only: %i[ show edit update destroy ]
  #before_action :current_place, only: %i[ show ]

  # GET /lessons or /lessons.json
  def index
    @lessons = Lesson.all
  end

  # GET /lessons/1 or /lessons/1.json
  def show

    #Create First LessonEvent for New Seekers
    if current_seeker.previous_lesson == nil
      @study_session = LessonEvent.create({
        seeker_id: current_seeker.id,
        lesson_id: 1,
        status: 3,
      })
    else

      # Create New LessonEvent
      @study_session = LessonEvent.create({
        seeker_id: current_seeker.id,
        lesson_id: @lesson.id,
        status: 0,
      })
    end

    # Define Content Links
    @teaching_link = "teaching_content/course_" + current_seeker.previous_lesson.course_id.to_s + "/lesson_" + (current_seeker.previous_lesson.id.to_i + 1).to_s
    @practice_link = "practice_content/course_" + current_seeker.previous_lesson.course_id.to_s + "/lesson_" + (current_seeker.previous_lesson.id.to_i + 1).to_s
  end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
  end

  # GET /lessons/1/edit
  def edit
  end

  # POST /lessons or /lessons.json
  def create
    @lesson = Lesson.new(lesson_params)

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to lesson_url(@lesson), notice: "Lesson was successfully created." }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1 or /lessons/1.json
  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to lesson_url(@lesson), notice: "Lesson was successfully updated." }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1 or /lessons/1.json
  def destroy
    @lesson.destroy

    respond_to do |format|
      format.html { redirect_to lessons_url, notice: "Lesson was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lesson
    if current_seeker.last_session == nil
      @lesson = Lesson.find(1)
      @course = Course.find(1)
    else
      @course = Course.find_by(:id => current_seeker.previous_lesson.course_id)
      @lesson = Lesson.find_by(:id => current_seeker.last_session.id + 1)
    end
  end

  # def logged-in Seeker and Error Message
  def require_login
    unless signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to seeker_session_path # halts request cycle
    end
  end

  # Only allow a list of trusted parameters through.
  def lesson_params
    params.fetch(:lesson, {})
  end
end
