json.extract! medium, :id, :title, :description, :duration, :link, :source, :producer, :provider, :hidden,
              :playlist_id, :speaker_ids, :user_id, :created_at, :updated_at
json.url admin_medium_url(medium, format: :json)
