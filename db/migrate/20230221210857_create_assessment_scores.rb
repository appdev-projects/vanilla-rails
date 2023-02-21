class CreateAssessmentScores < ActiveRecord::Migration[6.1]
  def change
    create_table :assessment_scores do |t|
      t.integer :seeker_id
      t.float :personalist
      t.float :communalist
      t.float :environmentalist
      t.float :transcendentalist
      t.string :spiritual_type

      t.timestamps
    end
  end
end
