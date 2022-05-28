class CreatePieces < ActiveRecord::Migration[6.1]
  def change
    create_table :pieces do |t|
      t.references :pieceowner, null: false, foreign_key: { to_table: :users }, index: true
      t.string :teamcolor
      t.string :piecetype
      t.integer :points

      t.timestamps
    end
  end
end
