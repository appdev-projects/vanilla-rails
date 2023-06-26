# == Schema Information
#
# Table name: lessons
#
#  id                   :bigint           not null, primary key
#  course_id            :integer
#  day                  :integer
#  title                :string
#  description          :string
#  learning_session_id  :integer
#  practice_session_id  :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  spiritual_type       :string
#  practice_description :string
#
class Lesson < ApplicationRecord
  has_many :lesson_events, class_name: "LessonEvent", foreign_key: "lesson_id"
  has_many  :assessment_questions, class_name: "AssessmentQuestion", foreign_key: "lesson_id"
  belongs_to :course, class_name: "Course", foreign_key: "course_id"

  #Route for Data Dump
  def self.to_csv
    require "csv"
    lessons = self.all
    headers = ["course_id", "practice_id", "day", "title", "description", "learning_session_id", "practice_session_id", "spiritual_type"]

    csv = CSV.generate(headers: true) do |csv|
      csv << headers

      lessons.each do |lesson_attr|
        row = []
        row.push(lesson_attr.course_id)
        row.push(lesson_attr.practice_id)
        row.push(lesson_attr.day)
        row.push(lesson_attr.title)
        row.push(lesson_attr.description)
        row.push(lesson_attr.learning_session_id)
        row.push(lesson_attr.practice_session_id)
        row.push(lesson_attr.spiritual_type)
        csv << row
      end
    end

    return csv
  end
end
