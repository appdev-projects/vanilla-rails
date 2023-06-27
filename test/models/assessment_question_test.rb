# == Schema Information
#
# Table name: assessment_questions
#
#  id             :bigint           not null, primary key
#  name           :string
#  question       :string
#  spiritual_type :string
#  number         :integer
#  assessment     :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  course_id      :integer
#  lesson_id      :integer
#
require "test_helper"

class AssessmentQuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
