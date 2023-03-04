json.extract! speaker, :id, :name, :description, :user_id, :created_at, :updated_at
json.url admin_speaker_url(speaker, format: :json)
