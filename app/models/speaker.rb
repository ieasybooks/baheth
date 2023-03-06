class Speaker < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :playlists # rubocop:disable Rails/HasAndBelongsToMany
  has_many :media, through: :playlists
  has_many :cues, through: :media

  validates :name, presence: true
end
