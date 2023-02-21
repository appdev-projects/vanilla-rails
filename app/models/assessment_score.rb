class AssessmentScore < ApplicationRecord
  belongs_to :seeker, required: true, class_name: "Seeker", foreign_key: "seeker_id"
end
