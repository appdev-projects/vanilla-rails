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
require "test_helper"

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
