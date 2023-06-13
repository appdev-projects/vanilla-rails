class SetDefaultValueForLessonEventStatus2 < ActiveRecord::Migration[6.1]
  def change
    change_column_default :lesson_events, :status, "not_started"
  end
end
