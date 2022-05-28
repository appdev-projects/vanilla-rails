class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many  :pieces, dependent: :destroy
  has_many  :votes, dependent: :destroy
  has_many  :comments, dependent: :destroy

  def pieces
    my_id = self.id
    matching_pieces = Piece.where({ :pieceowner => my_id })
    return matching_pieces
  end


end
