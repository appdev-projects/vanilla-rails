class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :status
      t.string :whiteteamcolor
      t.string :blackteamcolor
      t.string :outcome
      t.string :moves
      t.string :boardsetup

      t.timestamps
    end
  end
end
