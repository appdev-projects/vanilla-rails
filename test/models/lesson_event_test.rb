# == Schema Information
#
# Table name: lesson_events
#
#  id         :bigint           not null, primary key
#  seeker_id  :integer
#  lesson_id  :integer
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class LessonEventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
