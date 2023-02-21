# == Schema Information
#
# Table name: courses
#
#  id                :integer          not null, primary key
#  lessons_count     :integer
#  short_description :string
#  spiritual_type    :string
#  title             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Course < ApplicationRecord

  has_many  :students, through: :last_active_course, source: :seeker
  has_many  :lessons, class_name: "Lesson", foreign_key: "course_id", dependent: :destroy

end
