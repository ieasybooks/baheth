require 'json'
require 'optparse'

require_relative '../utilities/time_utilities'

GLOBAL_ATTRIBUTES = %w[source producer provider tag_list hidden playlist_id user_id].freeze

namespace :db do # rubocop:disable Metrics/BlockLength
  desc 'Import media to playlist based on JSON configuration file'
  task import_media_to_playlist: :environment do # rubocop:disable Metrics/BlockLength
    include TimeUtilities

    options = {}

    option_parser = OptionParser.new do |opts|
      opts.banner = 'Usage: rails db:import_media_to_playlist -- --config_file_path="/path/to/config.json"'

      opts.on('-c', '--config_file_path=CONFIG_FILE_PATH', String, '[REQUIRED] Specify configuration file path.') do |c|
        options[:config_file_path] = c
      end
    end

    args = option_parser.order!(ARGV) # this line is required, return `ARGV` with the intended arguments
    option_parser.parse! args

    if options[:config_file_path].nil?
      puts option_parser.help
      exit 1
    end

    config = JSON.parse(File.read(options[:config_file_path]))

    media_config = config['media'].map do |medium_config|
      GLOBAL_ATTRIBUTES.each do |attribute|
        medium_config[attribute] = config[attribute] unless medium_config.key? attribute
      end

      medium_config
    end

    config_file_dir = File.dirname(options[:config_file_path])

    media_config.each do |medium_config|
      transcript_srt_file_path = File.join(config_file_dir, medium_config['transcript_srt'])

      medium = Medium.new(
        title: medium_config['title'],
        description: medium_config['description'],
        duration: TimeUtilities.time_to_seconds(medium_config['duration']),
        link: medium_config['link'],
        source: medium_config['source'],
        producer: medium_config['producer'],
        provider: medium_config['provider'],
        transcript_srt: ActionDispatch::Http::UploadedFile.new(tempfile: File.new(transcript_srt_file_path),
                                                               filename: medium_config['transcript_srt']),
        hidden: medium_config['hidden'],
        playlist_id: medium_config['playlist_id'],
        user_id: medium_config['user_id']
      )

      medium.tag_list = medium_config['tag_list']
      medium.transcript_txt.attach(io: File.open(File.join(config_file_dir, medium_config['transcript_txt'])),
                                   filename: medium_config['transcript_txt'], content_type: 'text/plain')
      medium.save!
    end
  end
end
