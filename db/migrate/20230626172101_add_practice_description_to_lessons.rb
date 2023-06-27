class AddPracticeDescriptionToLessons < ActiveRecord::Migration[6.1]
  def change
    add_column :lessons, :practice_description, :string
  end
end
