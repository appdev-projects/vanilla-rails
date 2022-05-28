class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :status
      t.string :whiteteamcolor
      t.string :blackteamcolor
      t.string :outcome
      t.string :movehistory
      t.string :boardsetup

      t.timestamps
    end
  end
end
