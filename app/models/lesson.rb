# == Schema Information
#
# Table name: lessons
#
#  id                  :integer          not null, primary key
#  day                 :integer          default(0)
#  description         :string
#  spiritual_type      :string
#  title               :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  course_id           :integer
#  learning_session_id :string
#  practice_id         :integer
#  practice_session_id :string
#
class Lesson < ApplicationRecord

  has_many  :lesson_events, class_name: "LessonEvent", foreign_key: "lesson_id"

end
