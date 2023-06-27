# == Schema Information
#
# Table name: assessment_scores
#
#  id                         :bigint           not null, primary key
#  seeker_id                  :integer
#  personalist                :float            default(0.0)
#  communalist                :float            default(0.0)
#  environmentalist           :float            default(0.0)
#  transcendentalist          :float            default(0.0)
#  spiritual_type             :string           default("not_set")
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  divine_relationship        :float            default(0.0)
#  something_more             :float            default(0.0)
#  creator_relationship       :float            default(0.0)
#  love_others                :float            default(0.0)
#  chain_link                 :float            default(0.0)
#  authentic_vulnerable       :float            default(0.0)
#  nature_oneness             :float            default(0.0)
#  magic_vibrations           :float            default(0.0)
#  environment_harmony        :float            default(0.0)
#  inner_peace                :float            default(0.0)
#  self_knowing               :float            default(0.0)
#  inner_resources            :float            default(0.0)
#  divine_relationship_lived  :float            default(0.0)
#  something_more_lived       :float            default(0.0)
#  creator_relationship_lived :float            default(0.0)
#  love_others_lived          :float            default(0.0)
#  chain_link_lived           :float            default(0.0)
#  authentic_vulnerable_lived :float            default(0.0)
#  nature_oneness_lived       :float            default(0.0)
#  magic_vibrations_lived     :float            default(0.0)
#  environment_harmony_lived  :float            default(0.0)
#  inner_peace_lived          :float            default(0.0)
#  self_knowing_lived         :float            default(0.0)
#  inner_resources_lived      :float            default(0.0)
#
require "test_helper"

class AssessmentScoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
