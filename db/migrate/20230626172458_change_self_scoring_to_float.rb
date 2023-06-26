class ChangeSelfScoringToFloat < ActiveRecord::Migration[6.1]
  def change
    change_column :assessment_scores, :divine_relationship, :float
    change_column :assessment_scores, :something_more, :float
    change_column :assessment_scores, :creator_relationship, :float
    change_column :assessment_scores, :love_others, :float
    change_column :assessment_scores, :chain_link, :float
    change_column :assessment_scores, :authentic_vulnerable, :float
    change_column :assessment_scores, :nature_oneness, :float
    change_column :assessment_scores, :magic_vibrations, :float
    change_column :assessment_scores, :environment_harmony, :float
    change_column :assessment_scores, :inner_peace, :float
    change_column :assessment_scores, :self_knowing, :float
    change_column :assessment_scores, :inner_resources, :float
  end
end
