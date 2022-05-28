class Comment < ApplicationRecord
  belongs_to :commentor, class_name: "User"
  belongs_to :game

  validates :commenttext, presence: true

  scope :default_order, -> { order(created_at: :asc) }
end
