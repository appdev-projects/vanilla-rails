class SetDefaultValuesForKeysInSeekersTable < ActiveRecord::Migration[6.1]
  def change
    change_column_default :seekers, :active_course_id, 1
    change_column_default :seekers, :active_lesson_id, 1
  end
end
