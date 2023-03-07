class CreateCues < ActiveRecord::Migration[7.0]
  def change
    create_table :cues do |t|
      t.text :content
      t.interval :start_time
      t.interval :end_time
      t.boolean :hidden, null: false, default: false
      t.references :medium, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
