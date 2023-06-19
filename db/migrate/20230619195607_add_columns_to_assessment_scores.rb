class AddColumnsToAssessmentScores < ActiveRecord::Migration[6.1]
  def change
    add_column :assessment_scores, :divine_relationship, :integer
    add_column :assessment_scores, :something_more, :integer
    add_column :assessment_scores, :creator_relationship, :integer
    add_column :assessment_scores, :love_others, :integer
    add_column :assessment_scores, :chain_link, :integer
    add_column :assessment_scores, :authentic_vulnerable, :integer
    add_column :assessment_scores, :nature_oneness, :integer
    add_column :assessment_scores, :magic_vibrations, :integer
    add_column :assessment_scores, :environment_harmony, :integer
    add_column :assessment_scores, :inner_peace, :integer
    add_column :assessment_scores, :self_knowing, :integer
    add_column :assessment_scores, :inner_resources, :integer
  end
end
