class AddIdealToScoresModel < ActiveRecord::Migration[6.1]
  def float
    add_column :assessment_questions, :course_id, :integer
    add_column :assessment_questions, :lesson_id, :integer
  end
end
