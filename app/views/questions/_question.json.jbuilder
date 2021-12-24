json.extract! question, :id, :head, :text, :created_at, :updated_at
json.url question_url(question, format: :json)
