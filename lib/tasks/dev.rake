task :sample_data do
  p "Creating sample data for you"

  Game.create(
   status: "blacksturn",
   whiteteamcolor: "red",
   blackteamcolor: "blue",
   boardsetup: "asdkflsjflskdkjf",
   moves: "a2a4b7b5a4a5",
   outcome: "pending"
  )

end