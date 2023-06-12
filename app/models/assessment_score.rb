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
class AssessmentScore < ApplicationRecord
  belongs_to :seeker, required: true, class_name: "Seeker", foreign_key: "seeker_id"

  def self.to_csv
    require 'csv'
    aq = self.all
    headers = ["seeker_id", "personalist", "communalist", "environmentalist", "transcendentalist","spiritual_type", "created_at","updated_at"]

    
    csv = CSV.generate(headers: true) do |csv|

      csv << headers

        aq.each do |as_attr|
          row = []
          row.push(as_attr.seeker_id)
          row.push(as_attr.personalist)
          row.push(as_attr.communalist)
          row.push(as_attr.environmentalist)
          row.push(as_attr.transcendentalist)
          row.push(as_attr.spiritual_type)
          row.push(as_attr.created_at)
          row.push(as_attr.updated_at)

          csv << row
        end
      end

      return csv

    end

end

