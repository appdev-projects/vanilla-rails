class CourseIdAndLessonIdsAgain < ActiveRecord::Migration[6.1]
  def change
    add_column :assessment_questions, :course_id, :integer
    add_column :assessment_questions, :lesson_id, :integer
  end
end
