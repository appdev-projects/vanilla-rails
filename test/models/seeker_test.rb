# == Schema Information
#
# Table name: seekers
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  first_name             :string
#  phone_number           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  active_course_id       :integer
#  active_lesson_id       :integer
#
require "test_helper"

class SeekerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
