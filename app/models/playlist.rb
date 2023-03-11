class Playlist < ApplicationRecord
  include MeiliSearch::Rails

  extend Pagy::Meilisearch
  ActiveRecord_Relation.include Pagy::Meilisearch

  belongs_to :user
  has_and_belongs_to_many :speakers # rubocop:disable Rails/HasAndBelongsToMany
  has_many :media, dependent: :destroy
  has_many :cues, through: :media

  validates :title, :speakers, presence: true
  validates :link, url: { allow_blank: true, schemes: ['https'] }

  validate :one_speaker_at_least?

  acts_as_taggable

  meilisearch do
    attribute :title, :description

    attribute :tags do
      tag_list.join('، ')
    end
  end

  def one_speaker_at_least?
    return unless speakers.empty?

    errors.add(:speakers, 'need one speaker at least')
  end
end
