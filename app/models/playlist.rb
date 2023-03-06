class Playlist < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :speakers # rubocop:disable Rails/HasAndBelongsToMany
  has_many :media, dependent: :destroy
  has_many :cues, through: :media

  validates :title, presence: true

  validate :one_speaker_at_least?

  def one_speaker_at_least?
    return unless speakers.empty?

    errors.add(:speakers, 'need one speaker at least')
  end
end