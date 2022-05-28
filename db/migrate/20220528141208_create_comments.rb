class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :commentor, null: false, foreign_key: { to_table: :users }, index: true
      t.references :game, null: false, foreign_key: true
      t.string :commentroom, default: "general"
      t.text :commenttext

      t.timestamps
    end
  end
end
