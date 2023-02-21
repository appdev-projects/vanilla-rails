# == Schema Information
#
# Table name: lesson_events
#
#  id         :integer          not null, primary key
#  status     :integer          default("not_started")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lesson_id  :integer
#  seeker_id  :integer
#
class LessonEvent < ApplicationRecord

  enum status: { not_started: 0, teaching_done: 1, practice_done: 2, complete: 3}

  belongs_to :seeker, required: true, class_name: "Seeker", foreign_key: "seeker_id"
  belongs_to :lesson, class_name: "Lesson", foreign_key: "lesson_id"
  


end
