class AssessmentScoresController < ApplicationController
  before_action :require_login
  before_action :set_score
  before_action :set_course, only: %i[ show ]
  

  # GET /assessment_scores/1 or /assessment_scores/1.json
  def show
    @lesson = Lesson.find( current_seeker.lesson_events.last.lesson_id)
    if current_seeker.type_score == nil
      render "not_yet"
    elsif current_seeker.type_score.spiritual_type == "not_set"
      render "not_yet"
    else
      render "sanctuary"
    end
  end

  # PATCH/PUT /assessment_scores/1 or /assessment_scores/1.json
  def update
    respond_to do |format|
    
      #Capture AssessmentScore parameters as variables
    divine_relationship = params.dig( :assessment_score, :divine_relationship )
    something_more = params.dig( :assessment_score, :something_more )
    creator_relationship = params.dig( :assessment_score, :creator_relationship )
    love_others = params.dig( :assessment_score, :love_others )
    chain_link = params.dig( :assessment_score, :chain_link )
    authentic_vulnerable = params.dig( :assessment_score, :authentic_vulnerable )
    nature_oneness = params.dig( :assessment_score, :nature_oneness )
    magic_vibrations = params.dig( :assessment_score, :magic_vibrations )
    environment_harmony = params.dig( :assessment_score, :environment_harmony )
    inner_peace = params.dig( :assessment_score, :inner_peace )
    self_knowing = params.dig( :assessment_score, :self_knowing )
    inner_resources = params.dig( :assessment_score, :inner_resources )
    divine_relationship_lived = params.dig( :assessment_score, :divine_relationship_lived )
    something_more_lived = params.dig( :assessment_score, :something_more_lived )
    creator_relationship_lived = params.dig( :assessment_score, :creator_relationship_lived )
    love_others_lived = params.dig( :assessment_score, :love_others_lived )
    chain_link_lived = params.dig( :assessment_score, :chain_link_lived )
    authentic_vulnerable_lived = params.dig( :assessment_score, :authentic_vulnerable_lived )
    nature_oneness_lived = params.dig( :assessment_score, :nature_oneness_lived )
    magic_vibrations_lived = params.dig( :assessment_score, :magic_vibrations_lived )
    environment_harmony_lived = params.dig( :assessment_score, :environment_harmony_lived )
    inner_peace_lived = params.dig( :assessment_score, :inner_peace_lived )
    self_knowing_lived = params.dig( :assessment_score, :self_knowing_lived )
    inner_resources_lived = params.dig( :assessment_score, :inner_resources_lived )

    #Invoke Arrays that contain AssessmentScore data by type
    personalist_array = [inner_peace.to_f, self_knowing.to_f, inner_resources.to_f] 
    environmentalist_array = [nature_oneness.to_f, magic_vibrations.to_f, environment_harmony.to_f] 
    transcendentalist_array = [divine_relationship.to_f, something_more.to_f, creator_relationship.to_f] 
    communalist_array = [love_others.to_f, chain_link.to_f, authentic_vulnerable.to_f] 

    personalist_lived_array = [inner_peace_lived.to_f, self_knowing_lived.to_f, inner_resources_lived.to_f] 
    environmentalist_lived_array = [nature_oneness_lived.to_f, magic_vibrations_lived.to_f, environment_harmony_lived.to_f] 
    transcendentalist_lived_array = [divine_relationship_lived.to_f, something_more_lived.to_f, creator_relationship_lived.to_f] 
    communalist_lived_array = [love_others_lived.to_f, chain_link_lived.to_f, authentic_vulnerable_lived.to_f] 

    #Calculate type scores
    communalist_lived_score = communalist_lived_array.sum.to_f / 3
    personalist_lived_score = personalist_lived_array.sum.to_f / 3
    transcendentalist_lived_score = transcendentalist_lived_array.sum.to_f / 3
    environmentalist_lived_score = environmentalist_lived_array.sum.to_f / 3

    communalist_score = communalist_array.sum.to_f / 3
    personalist_score = personalist_array.sum.to_f / 3
    transcendentalist_score = transcendentalist_array.sum.to_f / 3
    environmentalist_score = environmentalist_array.sum.to_f / 3

    #Update Type Scores
  AssessmentScore.update(@type_score.id, :personalist => personalist_score, :environmentalist => environmentalist_score, :communalist => communalist_score, :transcendentalist => transcendentalist_score, :personalist_lived => personalist_lived_score, :environmentalist_lived => environmentalist_lived_score, :communalist_lived => communalist_lived_score, :transcendentalist_lived => transcendentalist_lived_score)

  p personalist_lived_array
  p personalist_lived_score
  p current_seeker.type_score.personalist_lived

    #Update Spiritual Type
    if @type_score.personalist.to_f > 0 && @type_score.communalist.to_f > 0 && @type_score.environmentalist.to_f > 0 && @type_score.transcendentalist.to_f > 0

      scores_array = Array.new
      scores_array.push( @type_score.personalist.to_f ) 
      scores_array.push( @type_score.communalist.to_f ) 
      scores_array.push( @type_score.environmentalist.to_f ) 
      scores_array.push( @type_score.transcendentalist.to_f )
      
      top_score = scores_array.sort.at( 3 ) 

      scores_hash = Hash.new
      scores_hash.store( :personalist, @type_score.personalist.to_f ) 
      scores_hash.store( :communalist, @type_score.communalist.to_f ) 
      scores_hash.store( :environmentalist, @type_score.environmentalist.to_f ) 
      scores_hash.store( :transcendentalist, @type_score.transcendentalist.to_f )

      AssessmentScore.update(@type_score.id, :spiritual_type => scores_hash.key( top_score ))
    end
      if @type_score.update(assessment_score_params)

        format.html { redirect_back_or_to course_lesson_path({ course_id: @study_session.lesson.course_id, id: Lesson.find_by(id: @study_session.lesson_id + 1) }), notice: "Well done, friend." }
        format.json { render :show, status: :ok, location: @type_score }
        format.js do
          render template: "assessment_scores/show.js.erb"
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @type_score.errors, status: :unprocessable_entity }
      end
    end
  end

  def info
    render template "devise/shared/spiritual_types"
  end

  def export
    as = AssessmentScore.all

    respond_to do |format|
      format.html do
        render
      end
      format.csv do
        send_data(as.to_csv, { :filename => "export_as.csv" })
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def assessment_score_params
    params.require(:assessment_score).permit(
      :seeker_id,
      :personalist,
      :communalist,
      :environmentalist,
      :transcendentalist,
      :spiritual_type,
      :divine_relationship,
      :something_more,
      :creator_relationship,
      :love_others,
      :chain_link,
      :authentic_vulnerable,
      :nature_oneness,
      :magic_vibrations,
      :environment_harmony,
      :inner_peace,
      :self_knowing,
      :inner_resources,
      :divine_relationship_lived,
      :something_more_lived,
      :creator_relationship_lived,
      :love_others_lived,
      :chain_link_lived,
      :authentic_vulnerable_lived,
      :nature_oneness_lived,
      :magic_vibrations_lived,
      :environment_harmony_lived,
      :inner_peace_lived,
      :self_knowing_lived,
      :inner_resources_lived
    )
  end

end
