# == Schema Information
#
# Table name: lessons
#
#  id                  :bigint           not null, primary key
#  course_id           :integer
#  day                 :integer
#  title               :string
#  description         :string
#  learning_session_id :integer
#  practice_session_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class Lesson < ApplicationRecord
end
