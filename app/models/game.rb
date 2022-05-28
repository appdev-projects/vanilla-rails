class Game < ApplicationRecord
  has_many  :moves, dependent: :destroy
end
