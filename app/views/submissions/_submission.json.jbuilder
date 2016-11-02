json.extract! submission, :id, :name, :email, :submission, :coverletter, :time, :created_at, :updated_at
json.url submission_url(submission, format: :json)