class Task < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "commenter_id"
  validates :commenter_id, presence: true
  validates :body, presence: true

  enum status: [:uncompleted, :in_progress, :completed]

  scope :by_user, ->(commenter_id) { where(commenter_id: commenter_id) }
end
