class LessonsController < ApplicationController
  before_action :require_login
  before_action :set_course, only: %i[ show edit update destroy export ]
  before_action :set_final_lesson, except: %i[ export ]
  before_action :set_lesson, only: %i[ show edit update destroy export ]
  before_action :set_lesson_event, only: %i[ show edit update destroy ]
  before_action :set_score, only: %i[ show ]
  before_action :set_skr_sprtl_type, except: %i[ export ]
  

  # GET /lessons or /lessons.json
  def index
    @lessons = Lesson.all
  end

  # GET /lessons/1 or /lessons/1.json
  def show
      # Define Content Links
      @teaching_link = "teaching_content/course_" + @course.id.to_s + "/lesson_" + (@lesson.day.to_i).to_s
      @practice_link = "practice_content/course_" + @course.id.to_s + "/lesson_" + (@lesson.day.to_i).to_s
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
