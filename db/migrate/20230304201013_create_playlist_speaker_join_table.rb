class CreatePlaylistSpeakerJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :playlists, :speakers do |t|
      t.index :playlist_id
      t.index :speaker_id
    end
  end
end
