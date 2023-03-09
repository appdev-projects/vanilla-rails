json.extract! task, :id, :body, :commenter_id, :completed_id, :in_progress_id, :incomplete_id, :status, :created_at, :updated_at
json.url task_url(task, format: :json)
