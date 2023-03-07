class CreateMedia < ActiveRecord::Migration[7.0]
  def change # rubocop:disable Metrics/MethodLength
    create_table :media do |t|
      t.string :title
      t.text :description
      t.interval :duration
      t.string :link
      t.integer :source, null: false, default: 0
      t.integer :producer, null: false, default: 0
      t.string :provider
      t.boolean :hidden, null: false, default: false
      t.references :playlist, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
