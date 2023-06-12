class CreateLessonEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :lesson_events do |t|
      t.integer :seeker_id
      t.integer :lesson_id
      t.string :status

      t.timestamps
    end
  end
end
