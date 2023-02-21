class AssessmentQuestionsController < ApplicationController
  before_action :set_assessment_question, only: %i[ show edit update destroy ]

  # GET /assessment_questions or /assessment_questions.json
  def index
    @assessment_questions = AssessmentQuestion.all
  end

  # GET /assessment_questions/1 or /assessment_questions/1.json
  def show
  end

  # GET /assessment_questions/new
  def new
    @assessment_question = AssessmentQuestion.new
  end

  # GET /assessment_questions/1/edit
  def edit
  end

  # POST /assessment_questions or /assessment_questions.json
  def create
    @assessment_question = AssessmentQuestion.new(assessment_question_params)

    respond_to do |format|
      if @assessment_question.save
        format.html { redirect_to assessment_question_url(@assessment_question), notice: "Assessment question was successfully created." }
        format.json { render :show, status: :created, location: @assessment_question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @assessment_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assessment_questions/1 or /assessment_questions/1.json
  def update
    respond_to do |format|
      if @assessment_question.update(assessment_question_params)
        format.html { redirect_to assessment_question_url(@assessment_question), notice: "Assessment question was successfully updated." }
        format.json { render :show, status: :ok, location: @assessment_question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @assessment_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assessment_questions/1 or /assessment_questions/1.json
  def destroy
    @assessment_question.destroy

    respond_to do |format|
      format.html { redirect_to assessment_questions_url, notice: "Assessment question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assessment_question
      @assessment_question = AssessmentQuestion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assessment_question_params
      params.fetch(:assessment_question, {})
    end
end
