json.extract! playlist, :id, :title, :description, :link, :tag_list, :hidden,
              :medium_ids, :speaker_ids, :user_id, :created_at, :updated_at
json.url admin_playlist_url(playlist, format: :json)
