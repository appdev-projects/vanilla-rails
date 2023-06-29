class AddAssessmentFlagToLessons < ActiveRecord::Migration[6.1]
  def change
    add_column :lessons, :has_assessment, :boolean, :default => false
  end
end
