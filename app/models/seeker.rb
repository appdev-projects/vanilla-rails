# == Schema Information
#
# Table name: seekers
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  first_name             :string
#  phone_number           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class Seeker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


#AssessmentScore Associations
has_one :type_score, class_name: "AssessmentScore", foreign_key: "seeker_id"

#Course Associations
belongs_to :active_course, class_name: "Course", foreign_key: "active_course_id"

#LessonEvent Associations
has_many  :lesson_events, class_name: "LessonEvent", foreign_key: "seeker_id", dependent: :destroy
has_many :complete_sessions, -> { where(status: "complete") }, class_name: "LessonEvent", foreign_key: "seeker_id"

#Lesson Associations
has_one :previous_lesson, through: :complete_sessions, source: :lesson





end

