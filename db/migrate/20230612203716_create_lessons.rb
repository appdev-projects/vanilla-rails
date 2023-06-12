class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.integer :course_id
      t.integer :day
      t.string :title
      t.string :description
      t.integer :learning_session_id
      t.integer :practice_session_id

      t.timestamps
    end
  end
end
