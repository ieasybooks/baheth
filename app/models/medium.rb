require 'srt'

class Medium < ApplicationRecord
  SOURCES = %i[youtube].freeze
  PRODUCERS = %i[almufaragh].freeze

  include MeiliSearch::Rails

  extend Pagy::Meilisearch
  ActiveRecord_Relation.include Pagy::Meilisearch

  attr_accessor :transcript_srt

  after_update :delete_cues, if: proc { |medium| !medium.transcript_srt.nil? }
  after_save :insert_cues, if: proc { |medium| !medium.transcript_srt.nil? }

  belongs_to :user
  belongs_to :playlist
  has_many :speakers, through: :playlist
  has_many :cues, dependent: :delete_all
  has_one_attached :transcript_txt, dependent: :destroy

  validates :title, :duration, :link, :source, :producer, :provider, :transcript_txt, presence: true
  validates :transcript_srt, presence: true, on: :create
  validates :link, url: { schemes: ['https'] }
  validates :duration, numericality: { greater_than: 0 }

  validate :transcript_txt_content_type
  validate :transcript_srt_content_type, if: proc { |medium| !medium.transcript_srt.nil? }
  validate :transcript_srt_format, if: proc { |medium| !medium.transcript_srt.nil? }

  acts_as_taggable

  enum :source, SOURCES, prefix: true
  enum :producer, PRODUCERS, prefix: true

  meilisearch do
    attribute :title, :description

    attribute :tags do
      tag_list.join('، ')
    end
  end

  def insert_cues
    new_cues = SRT::File.parse(File.new(transcript_srt)).lines.map do |line|
      {
        content: line.text.join(' '),
        start_time: line.start_time,
        end_time: line.end_time,
        medium_id: id, user_id: user.id
      }
    end

    Cue.insert_all new_cues # rubocop:disable Rails/SkipsModelValidations
    Cue.reindex!
  end

  def delete_cues
    cues.delete_all
  end

  def transcript_txt_content_type
    errors.add(:transcript_txt, 'should be .txt file') if transcript_txt.filename&.extension != 'txt'
  end

  def transcript_srt_content_type
    return if transcript_srt.original_filename.split('.')[-1] == 'srt'

    errors.add(:transcript_srt, 'should be .srt file')
  end

  def transcript_srt_format
    SRT::File.parse(File.new(transcript_srt))
  rescue StandardError
    errors.add(:transcript_srt, 'should be .srt file')
  end
end
