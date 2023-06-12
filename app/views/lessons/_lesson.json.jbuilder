json.extract! lesson, :id, :course_id, :day, :title, :description, :learning_session_id, :practice_session_id, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
