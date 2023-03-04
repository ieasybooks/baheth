class Speaker < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :playlists # rubocop:disable Rails/HasAndBelongsToMany

  validates :name, presence: true
end
