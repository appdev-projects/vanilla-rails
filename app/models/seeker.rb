class Seeker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many  :lesson_events, class_name: "LessonEvent", foreign_key: "seeker_id", dependent: :destroy

has_one :last_session, -> { where(status: "complete") }, class_name: "LessonEvent", foreign_key: "seeker_id"
has_one :previous_lesson, through: :last_session, source: :lesson
has_one :type_score, class_name: "AssessmentScore", foreign_key: "seeker_id"

validates(:full_name, { :presence => true })

end
