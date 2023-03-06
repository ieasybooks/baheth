class Medium < ApplicationRecord
  belongs_to :user
  belongs_to :playlist
  has_many :speakers, through: :playlist
  has_many :cues, dependent: :destroy

  validates :title, :duration, :link, presence: true
  validates :link, url: { schemes: ['https'] }
end
