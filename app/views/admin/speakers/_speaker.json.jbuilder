json.extract! speaker, :id, :name, :description, :tag_list, :hidden,
              :medium_ids, :playlist_ids, :user_id, :created_at, :updated_at
json.url admin_speaker_url(speaker, format: :json)
