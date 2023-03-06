class Medium < ApplicationRecord
  belongs_to :user
  belongs_to :playlist
  has_many :speakers, through: :playlist
  has_many :cues, dependent: :destroy
  has_one_attached :transcript

  validates :title, :duration, :link, :transcript, presence: true
  validates :link, url: { schemes: ['https'] }

  validate :plain_text_transcript?

  def plain_text_transcript?
    errors.add(:transcript, 'should be text/plain file (.txt)') if transcript.content_type != 'text/plain'
  end
end
