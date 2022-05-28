class CreateMoves < ActiveRecord::Migration[6.1]
  def change
    create_table :moves do |t|
      t.references :game, null: false, foreign_key: true, index: true
      t.string :suggestedmove
      t.boolean :legal
      t.boolean :accepted

      t.timestamps
    end
  end
end
