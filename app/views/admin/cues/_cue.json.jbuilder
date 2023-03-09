json.extract! cue, :id, :content, :start_time, :end_time,
              :medium_id, :playlist_id, :speaker_ids, :user_id, :created_at, :updated_at
json.url admin_cue_url(cue, format: :json)
