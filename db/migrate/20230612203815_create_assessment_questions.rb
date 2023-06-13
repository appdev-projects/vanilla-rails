class CreateAssessmentQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :assessment_questions do |t|
      t.string :name
      t.string :question
      t.string :spiritual_type
      t.integer :number
      t.string :assessment

      t.timestamps
    end
  end
end
