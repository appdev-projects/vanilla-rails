class AddActiveCourseIdToSeekers < ActiveRecord::Migration[6.1]
  def change
    add_column :seekers, :active_course_id, :integer
  end
end
