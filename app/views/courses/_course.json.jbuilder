json.extract! course, :id, :spiritual_type, :title, :short_description, :lessons_count, :created_at, :updated_at
json.url course_url(course, format: :json)
