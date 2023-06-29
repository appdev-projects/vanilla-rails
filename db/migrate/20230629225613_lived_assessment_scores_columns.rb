class LivedAssessmentScoresColumns < ActiveRecord::Migration[6.1]
  def change
    add_column :assessment_scores, :personalist_lived, :float, :default => 0
    add_column :assessment_scores, :communalist_lived, :float, :default => 0
    add_column :assessment_scores, :transcendentalist_lived, :float, :default => 0
    add_column :assessment_scores, :environmentalist_lived, :float, :default => 0
  end
end
