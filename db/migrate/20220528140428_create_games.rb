class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :status, default: "active"
      t.string :whiteteamcolor
      t.string :blackteamcolor
      t.string :outcome
      t.string :movehistory
      t.string :boardsetup

      t.timestamps
    end
  end
end
