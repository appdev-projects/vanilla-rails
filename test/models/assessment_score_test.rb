# == Schema Information
#
# Table name: assessment_scores
#
#  id                   :bigint           not null, primary key
#  seeker_id            :integer
#  personalist          :float
#  communalist          :float
#  environmentalist     :float
#  transcendentalist    :float
#  spiritual_type       :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  divine_relationship  :integer
#  something_more       :integer
#  creator_relationship :integer
#  love_others          :integer
#  chain_link           :integer
#  authentic_vulnerable :integer
#  nature_oneness       :integer
#  magic_vibrations     :integer
#  environment_harmony  :integer
#  inner_peace          :integer
#  self_knowing         :integer
#  inner_resources      :integer
#
require "test_helper"

class AssessmentScoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
