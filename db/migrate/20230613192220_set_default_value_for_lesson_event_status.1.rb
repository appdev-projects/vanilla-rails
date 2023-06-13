class SetDefaultValueForLessonEventStatus < ActiveRecord::Migration[6.1]
  def change
    change_column_default :lesson_events, :status, "not started"
  end
end
