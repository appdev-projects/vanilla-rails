class AddIdealToScoresModel < ActiveRecord::Migration[6.1]
  def float
    add_column :assessment_scores, :divine_relationship_lvd, :float
    add_column :assessment_scores, :something_more_lvd, :float
    add_column :assessment_scores, :creator_relationship_lvd, :float
    add_column :assessment_scores, :love_others_lvd, :float
    add_column :assessment_scores, :chain_link_lvd, :float
    add_column :assessment_scores, :authentic_vulnerable_lvd, :float
    add_column :assessment_scores, :nature_oneness_lvd, :float
    add_column :assessment_scores, :magic_vibrations_lvd, :float
    add_column :assessment_scores, :environment_harmony_lvd, :float
    add_column :assessment_scores, :inner_peace_lvd, :float
    add_column :assessment_scores, :self_knowing_lvd, :float
    add_column :assessment_scores, :inner_resources_lvd, :float
  end
end
