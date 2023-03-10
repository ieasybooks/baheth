class CreatePlaylists < ActiveRecord::Migration[7.0]
  def change
    create_table :playlists do |t|
      t.string :title
      t.text :description
      t.string :link
      t.boolean :hidden, null: false, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
