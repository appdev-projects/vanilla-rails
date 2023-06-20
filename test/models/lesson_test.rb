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
#  spiritual_type      :string
#
require "test_helper"

class LessonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
