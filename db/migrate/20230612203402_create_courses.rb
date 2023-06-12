class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :spiritual_type
      t.string :title
      t.string :short-description
      t.integer :lessons_count

      t.timestamps
    end
  end
end
