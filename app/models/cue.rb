class Cue < ApplicationRecord
  include MeiliSearch::Rails

  extend Pagy::Meilisearch
  ActiveRecord_Relation.include Pagy::Meilisearch

  belongs_to :user
  belongs_to :medium
  has_one :playlist, through: :medium
  has_many :speakers, through: :playlist

  delegate :id, to: :playlist, prefix: true

  validates :content, :start_time, :end_time, presence: true
  validates :start_time, numericality: { greater_than_or_equal: 0 }
  validates :end_time, numericality: { greater_than: :start_time }

  meilisearch do
    attribute :content
  end

  def truncated_content(content_limit = 25)
    content.size > content_limit ? "#{content[0..content_limit]}..." : content
  end

  def previous_cue
    medium.cues.select { |cue| cue.start_time < start_time }
          .min_by { |cue| start_time - cue.start_time }
  end

  def next_cue
    medium.cues.select { |cue| cue.start_time > start_time }
          .min_by { |cue| cue.start_time - start_time }
  end
end
