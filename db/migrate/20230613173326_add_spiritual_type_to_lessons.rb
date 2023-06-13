class AddSpiritualTypeToLessons < ActiveRecord::Migration[6.1]
  def change
    add_column :lessons, :spiritual_type, :string
  end
end
