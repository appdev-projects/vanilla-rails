class Piece < ApplicationRecord
  belongs_to :pieceowner, class_name: "User"
end
