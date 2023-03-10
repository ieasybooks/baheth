class Medium < ApplicationRecord
  SOURCES = %i[youtube].freeze
  PRODUCERS = %i[almufaragh].freeze

  include MeiliSearch::Rails

  extend Pagy::Meilisearch
  ActiveRecord_Relation.include Pagy::Meilisearch

  belongs_to :user
  belongs_to :playlist
  has_many :speakers, through: :playlist
  has_many :cues, dependent: :destroy
  has_one_attached :transcript_txt

  validates :title, :duration, :link, :source, :producer, :provider, :transcript_txt, presence: true
  validates :link, url: { schemes: ['https'] }
  validates :duration, numericality: { greater_than: 0 }

  validate :plain_text_transcript_txt?

  acts_as_taggable

  enum :source, SOURCES, prefix: true
  enum :producer, PRODUCERS, prefix: true

  def plain_text_transcript_txt?
    errors.add(:transcript_txt, 'should be text/plain file (.txt)') if transcript_txt.content_type != 'text/plain'
  end

  meilisearch do
    attribute :title, :description

    attribute :tags do
      tag_list.join('، ')
    end
  end
end
