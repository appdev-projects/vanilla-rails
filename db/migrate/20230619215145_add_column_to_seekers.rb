class AddColumnToSeekers < ActiveRecord::Migration[6.1]
  def change
    add_column :seekers, :active_lesson_id, :integer
  end
end
