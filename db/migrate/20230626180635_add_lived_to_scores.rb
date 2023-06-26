class AddLivedToScores < ActiveRecord::Migration[6.1]
  def change
    add_column :assessment_scores, :divine_relationship_lived, :float
    add_column :assessment_scores, :something_more_lived, :float
    add_column :assessment_scores, :creator_relationship_lived, :float
    add_column :assessment_scores, :love_others_lived, :float
    add_column :assessment_scores, :chain_link_lived, :float
    add_column :assessment_scores, :authentic_vulnerable_lived, :float
    add_column :assessment_scores, :nature_oneness_lived, :float
    add_column :assessment_scores, :magic_vibrations_lived, :float
    add_column :assessment_scores, :environment_harmony_lived, :float
    add_column :assessment_scores, :inner_peace_lived, :float
    add_column :assessment_scores, :self_knowing_lived, :float
    add_column :assessment_scores, :inner_resources_lived, :float
  end
end
