json.extract! speaker, :id, :name, :description, :playlist_ids, :user_id, :created_at, :updated_at
json.url admin_speaker_url(speaker, format: :json)
