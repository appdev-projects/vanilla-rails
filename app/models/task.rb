class Task < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "commenter_id"
  validates :commenter_id, presence: true
  validates :body, presence: true
end
