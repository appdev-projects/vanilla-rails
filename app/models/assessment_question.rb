# == Schema Information
#
# Table name: assessment_questions
#
#  id             :bigint           not null, primary key
#  name           :string
#  question       :string
#  string         :string
#  spiritual_type :string
#  number_string  :string
#  assessment     :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class AssessmentQuestion < ApplicationRecord
end
