json.extract! assessment_question, :id, :name, :question, :string, :spiritual_type, :number_string, :assessment, :created_at, :updated_at
json.url assessment_question_url(assessment_question, format: :json)
