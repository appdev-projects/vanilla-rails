class ChangeAssessmentQuestionsNumberStringToInteger < ActiveRecord::Migration[6.1]
  def change
    change_column :assessment_questions, :number_string, :string
    rename_column :assessment_questions, :number_string, :integer
  end
end
