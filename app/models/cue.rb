class Cue < ApplicationRecord
  belongs_to :user
  belongs_to :medium
  has_one :playlist, through: :medium
  has_many :speakers, through: :playlist

  validates :content, :start_time, :end_time, presence: true
end
