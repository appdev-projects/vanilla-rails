class Game < ApplicationRecord
  has_many  :moves, dependent: :destroy
  has_many  :comments, dependent: :destroy
end
