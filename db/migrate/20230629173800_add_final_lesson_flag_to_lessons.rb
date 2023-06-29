class AddFinalLessonFlagToLessons < ActiveRecord::Migration[6.1]
  def change
    add_column :lessons, :is_final, :boolean, :default => false
  end
end
