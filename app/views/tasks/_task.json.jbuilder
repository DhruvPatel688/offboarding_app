json.extract! task, :id, :offboarding_id, :title, :status, :assigned_to, :notes, :created_at, :updated_at
json.url task_url(task, format: :json)
