class Game < ApplicationRecord
  has_many  :moves, dependent: :destroy
  has_many  :comments, dependent: :destroy

  enum status: { active: "active", complete: "complete" }

  scope :active, -> { where(status: "active") }
end
