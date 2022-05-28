class Piece < ApplicationRecord
  belongs_to :pieceowner, class_name: "User"

  enum teamcolor: { red: "red", orange: "orange", yellow: "yellow", blue: "blue", purple: "purple", pink: "pink", brown: "brown" }
  enum piecetype: { pawn: "pawn", rook: "rook", knight: "knight", bishop: "bishop", queen: "queen"}


  

end
