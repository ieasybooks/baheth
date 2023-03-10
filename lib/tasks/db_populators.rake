require 'faker'

Faker::Config.locale = :ar

namespace :db do # rubocop:disable Metrics/BlockLength
  desc 'Empty the speakers table and fill it with fake data'
  task reset_and_populate_fake_speakers: :environment do
    user = User.first

    Speaker.delete_all
    speakers = []

    10.times do
      speaker = Speaker.new(
        name: Faker::Name.name,
        description: Faker::Lorem.paragraphs.join(' '),
        hidden: false,
        user:
      )

      speaker.tag_list = Faker::Lorem.words

      speakers << speaker
    end

    Speaker.import! speakers
  end

  desc 'Empty the playlists table and fill it with fake data'
  task reset_and_populate_fake_playlists: :environment do
    user = User.first

    Playlist.delete_all
    playlists = []

    Speaker.all.each do |speaker|
      10.times do
        playlist = Playlist.new(
          title: Faker::Book.title,
          description: Faker::Lorem.paragraphs.join(' '),
          link: 'https://youtube.com',
          hidden: false,
          speakers: [speaker],
          user:
        )

        playlist.tag_list = Faker::Lorem.words

        playlists << playlist
      end
    end

    Playlist.import! playlists
  end

  desc 'Empty the media table and fill it with fake data'
  task reset_and_populate_fake_media: :environment do
    user = User.first

    Medium.delete_all
    media = []

    Playlist.all.each do |playlist|
      10.times do
        medium = Medium.new(
          title: Faker::Book.title,
          description: Faker::Lorem.paragraphs.join(' '),
          duration: Faker::Number.between(from: 100, to: 5000),
          link: 'https://youtube.com',
          source: 'youtube',
          producer: 'almufaragh',
          provider: Faker::Name.name,
          hidden: false,
          playlist:,
          user:
        )

        medium.tag_list = Faker::Lorem.words
        medium.transcript.attach(io: Rails.root.join('test/fixtures/files/transcript.txt').open,
                                 filename: 'transcript.txt', content_type: 'text/plain')

        media << medium
      end
    end

    Medium.import! media
  end

  desc 'Empty the cues table and fill it with fake data'
  task reset_and_populate_fake_cues: :environment do
    user = User.first

    Cue.delete_all
    cues = []

    Medium.all.each do |medium|
      10.times do
        cue = Cue.new(
          content: Faker::Lorem.paragraphs.join(' '),
          start_time: Faker::Number.between(from: 100, to: 1000),
          end_time: Faker::Number.between(from: 1001, to: 5000),
          medium:,
          user:
        )

        cues << cue
      end
    end

    Cue.import! cues
  end

  desc 'Empty the database and fill it with fake data'
  task reset_and_populate_fake: %i[
    reset_and_populate_fake_speakers
    reset_and_populate_fake_playlists
    reset_and_populate_fake_media
    reset_and_populate_fake_cues
  ]
end