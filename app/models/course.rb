# == Schema Information
#
# Table name: courses
#
#  id                :bigint           not null, primary key
#  spiritual_type    :string
#  title             :string
#  short_description :string
#  lessons_count     :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Course < ApplicationRecord

  has_many  :students, class_name: "Seeker", foreign_key: "active_course_id"
  has_many  :lessons, class_name: "Lesson", foreign_key: "course_id", dependent: :destroy
  has_many  :assessment_questions, class_name: "AssessmentQuestion", foreign_key: "course_id"

  def self.to_csv
    require 'csv'
    courses = self.all
    headers = ["id", "title", "short_description", "spiritual_type", "lessons_count"]

    
    csv = CSV.generate(headers: true) do |csv|

      csv << headers

        courses.each do |course_attr|
          row = []
          row.push(course_attr.id)
          row.push(course_attr.title)
          row.push(course_attr.short_description)
          row.push(course_attr.spiritual_type)
          row.push(course_attr.lessons_count)
          csv << row
        end
      end

      return csv

    end


end
