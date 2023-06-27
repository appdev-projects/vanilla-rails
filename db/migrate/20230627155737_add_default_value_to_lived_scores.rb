class AddDefaultValueToLivedScores < ActiveRecord::Migration[6.1]
  def change
    change_column_default :assessment_scores, :divine_relationship_lived, 0.0
    change_column_default :assessment_scores, :something_more_lived, 0.0
    change_column_default :assessment_scores, :creator_relationship_lived, 0.0
    change_column_default :assessment_scores, :love_others_lived, 0.0
    change_column_default :assessment_scores, :chain_link_lived, 0.0
    change_column_default :assessment_scores, :authentic_vulnerable_lived, 0.0
    change_column_default :assessment_scores, :nature_oneness_lived, 0.0
    change_column_default :assessment_scores, :magic_vibrations_lived, 0.0
    change_column_default :assessment_scores, :environment_harmony_lived, 0.0
    change_column_default :assessment_scores, :inner_peace_lived, 0.0
    change_column_default :assessment_scores, :self_knowing_lived, 0.0
    change_column_default :assessment_scores, :inner_resources_lived, 0.0
  end
end
