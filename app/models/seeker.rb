class Seeker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many  :lesson_events, class_name: "LessonEvent", foreign_key: "seeker_id", dependent: :destroy
has_many :complete_sessions, -> { where(status: "complete") }, class_name: "LessonEvent", foreign_key: "seeker_id"
has_one :previous_lesson, through: :complete_sessions, source: :lesson
has_one :type_score, class_name: "AssessmentScore", foreign_key: "seeker_id"

end
