class ChangeQuestionColumnTypeInAssessmentQuestions < ActiveRecord::Migration[6.1]
  def change
    change_column :assessment_questions, :number, 'integer USING (number::integer)'
  end
end
