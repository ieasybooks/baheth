class Medium < ApplicationRecord
  SOURCES = %i[youtube].freeze
  PRODUCERS = %i[almufaragh].freeze

  belongs_to :user
  belongs_to :playlist
  has_many :speakers, through: :playlist
  has_many :cues, dependent: :destroy
  has_one_attached :transcript

  validates :title, :duration, :link, :source, :producer, :provider, :transcript, presence: true
  validates :link, url: { schemes: ['https'] }

  validate :plain_text_transcript?

  enum :source, SOURCES, prefix: true
  enum :producer, PRODUCERS, prefix: true

  def plain_text_transcript?
    errors.add(:transcript, 'should be text/plain file (.txt)') if transcript.content_type != 'text/plain'
  end
end
