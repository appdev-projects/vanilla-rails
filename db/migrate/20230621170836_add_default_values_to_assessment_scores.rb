class AddDefaultValuesToAssessmentScores < ActiveRecord::Migration[6.1]
  def change
    change_column_default :assessment_scores, :personalist, 0
    change_column_default :assessment_scores, :communalist, 0
    change_column_default :assessment_scores, :environmentalist, 0
    change_column_default :assessment_scores, :transcendentalist, 0
    change_column_default :assessment_scores, :spiritual_type, "not_set"
    change_column_default :assessment_scores, :divine_relationship, 0
    change_column_default :assessment_scores, :something_more, 0
    change_column_default :assessment_scores, :creator_relationship, 0
    change_column_default :assessment_scores, :love_others, 0
    change_column_default :assessment_scores, :chain_link, 0
    change_column_default :assessment_scores, :authentic_vulnerable, 0
    change_column_default :assessment_scores, :nature_oneness, 0
    change_column_default :assessment_scores, :magic_vibrations, 0
    change_column_default :assessment_scores, :environment_harmony, 0
    change_column_default :assessment_scores, :inner_peace, 0
    change_column_default :assessment_scores, :self_knowing, 0
    change_column_default :assessment_scores, :inner_resources, 0
  end
end
