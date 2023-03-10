class Speaker < ApplicationRecord
  include MeiliSearch::Rails

  extend Pagy::Meilisearch
  ActiveRecord_Relation.include Pagy::Meilisearch

  belongs_to :user
  has_and_belongs_to_many :playlists # rubocop:disable Rails/HasAndBelongsToMany
  has_many :media, through: :playlists
  has_many :cues, through: :media

  validates :name, presence: true

  acts_as_taggable

  meilisearch do
    attribute :name, :description

    attribute :tags do
      tag_list.join('، ')
    end
  end
end
