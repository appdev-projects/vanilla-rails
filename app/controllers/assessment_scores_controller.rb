class AssessmentScoresController < ApplicationController
  before_action :require_login
  before_action :set_lesson_event, only: %i[ show update destroy ]


  # GET /assessment_scores/1 or /assessment_scores/1.json 
  def show
    if current_seeker.type_score == nil
      render "not_yet"
    elsif current_seeker.type_score.spiritual_type == "not set"
      render "not_yet"
    else
    render "sanctuary"
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
  
# CHANGE TO CALCULATION OF SPIRITUAL TYPE FIELD
    # if @type_score.personalist != nil && @type_score.communalist != nil && @type_score.environmentalist != nil && @type_score.transcendentalist != nil 
    #   scores = Array.new
    #   scores = [{type: :personalist, score: @type_score.personalist}, { type: :communalist, score:  @type_score.communalist},{ type: :environmentalist, score:  @type_score.environmentalist},{ type: :transcendentalist, score:  @type_score.transcendentalist} ]
  
    #   @type_score.spiritual_type = scores.max_by{|k| k[:score] }[:type].to_s
    #   @type_score.save 
  # end

  def export
    as = AssessmentScore.all
      
      respond_to do |format|
        format.html do
          render
        end
        format.csv do
           send_data(as.to_csv, { :filename =>  "export_as.csv"} )
        end
      end
  end

  private

    # Only allow a list of trusted parameters through.
    def assessment_score_params
      params.require(:assessment_score).permit(:seeker_id, :personalist, :communalist, :environmentalist, :transcendentalist, :spiritual_type)
    end
end
