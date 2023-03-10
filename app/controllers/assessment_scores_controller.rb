class AssessmentScoresController < ApplicationController
  before_action :require_login
  before_action :set_assessment_score, only: %i[ show edit update destroy ]
  before_action :set_course, only: %i[ show edit update destroy ]
  before_action :set_lesson, only: %i[ show edit update destroy ]
  before_action :set_lesson_event, only: %i[ show edit update destroy ]
  before_action :set_final_lesson

  # GET /assessment_scores or /assessment_scores.json
  def index
    @assessment_scores = AssessmentScore.all
  end

  # GET /assessment_scores/1 or /assessment_scores/1.json
  def show
  end

  # GET /assessment_scores/new
  def new
    @assessment_score = AssessmentScore.new
  end

  # GET /assessment_scores/1/edit
  def edit
  end

  # POST /assessment_scores or /assessment_scores.json
  def create
    @assessment_score = AssessmentScore.new(assessment_score_params)

    respond_to do |format|
      if @assessment_score.save
        format.html { redirect_to assessment_score_url(@assessment_score), notice: "Assessment score was successfully created." }
        format.json { render :show, status: :created, location: @assessment_score }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @assessment_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assessment_scores/1 or /assessment_scores/1.json
  def update
    respond_to do |format|
      if @assessment_score.update(assessment_score_params)
        format.html { redirect_back_or_to course_lesson_path({ course_id: @lesson_event.lesson.course_id, id: Lesson.find_by(id: @lesson_event.lesson_id + 1) }), notice: "Well done, friend." }
        format.json { render :show, status: :ok, location: @assessment_score }
        format.js do
          render template: "assessment_scores/show.js.erb"
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @assessment_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assessment_scores/1 or /assessment_scores/1.json
  def destroy
    @assessment_score.destroy

    respond_to do |format|
      format.html { redirect_to assessment_scores_url, notice: "Assessment score was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assessment_score
      @assessment_score = AssessmentScore.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assessment_score_params
      params.require(:assessment_score).permit(:seeker_id, :personalist, :communalist, :environmentalist, :transcendentalist, :spiritual_type)
    end
end
