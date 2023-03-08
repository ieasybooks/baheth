class Cue < ApplicationRecord
  belongs_to :user
  belongs_to :medium
  has_one :playlist, through: :medium
  has_many :speakers, through: :playlist

  delegate :id, to: :playlist, prefix: true

  validates :content, :start_time, :end_time, presence: true

  def truncated_content(content_limit = 25)
    content.size > content_limit ? "#{content[0..content_limit]}..." : content
  end
end
