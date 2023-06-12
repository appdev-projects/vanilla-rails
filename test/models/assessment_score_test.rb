# == Schema Information
#
# Table name: assessment_scores
#
#  id                :bigint           not null, primary key
#  seeker_id         :integer
#  personalist       :float
#  communalist       :float
#  environmentalist  :float
#  transcendentalist :float
#  spiritual_type    :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require "test_helper"

class AssessmentScoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
