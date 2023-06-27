# == Schema Information
#
# Table name: assessment_questions
#
#  id             :bigint           not null, primary key
#  name           :string
#  question       :string
#  spiritual_type :string
#  number         :integer
#  assessment     :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  course_id      :integer
#  lesson_id      :integer
#
class AssessmentQuestion < ApplicationRecord

  def self.to_csv
    require 'csv'
    aq = self.all
    headers = ["name", "question", "spiritual_type", "number", "assessment", "created_at","updated_at"]

    
    csv = CSV.generate(headers: true) do |csv|

      csv << headers

        aq.each do |aq_attr|
          row = []
          row.push(aq_attr.name)
          row.push(aq_attr.question)
          row.push(aq_attr.spiritual_type)
          row.push(aq_attr.number)
          row.push(aq_attr.assessment)
          row.push(aq_attr.created_at)
          row.push(aq_attr.updated_at)
          csv << row
        end
      end

      return csv

    end

end

