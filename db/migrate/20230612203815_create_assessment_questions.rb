class CreateAssessmentQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :assessment_questions do |t|
      t.string :name
      t.string :question
      t.string :string
      t.string :spiritual_type
      t.string :number_string
      t.string :assessment

      t.timestamps
    end
  end
end
