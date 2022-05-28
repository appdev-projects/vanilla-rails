class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.references :voter, null: false, foreign_key: { to_table: :users }, index: true
      t.references :move, null: false, foreign_key: true

      t.timestamps
    end
  end
end
