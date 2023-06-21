# == Schema Information
#
# Table name: assessment_scores
#
#  id                   :bigint           not null, primary key
#  seeker_id            :integer
#  personalist          :float            default(0.0)
#  communalist          :float            default(0.0)
#  environmentalist     :float            default(0.0)
#  transcendentalist    :float            default(0.0)
#  spiritual_type       :string           default("not_set")
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  divine_relationship  :integer          default(0)
#  something_more       :integer          default(0)
#  creator_relationship :integer          default(0)
#  love_others          :integer          default(0)
#  chain_link           :integer          default(0)
#  authentic_vulnerable :integer          default(0)
#  nature_oneness       :integer          default(0)
#  magic_vibrations     :integer          default(0)
#  environment_harmony  :integer          default(0)
#  inner_peace          :integer          default(0)
#  self_knowing         :integer          default(0)
#  inner_resources      :integer          default(0)
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
