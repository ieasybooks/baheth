require 'application_system_test_case'

module Admin
  class PlaylistsTest < ApplicationSystemTestCase
    include Devise::Test::IntegrationHelpers

    setup do
      sign_in users(:first_user)

      @playlist = playlists(:first_playlist)
      @speaker = speakers(:first_speaker)
    end

    test 'visiting the index' do
      visit admin_playlists_url
      assert_selector 'h1', text: 'Playlists'
    end

    test 'should create playlist' do
      visit admin_playlists_url
      click_on 'New playlist'

      fill_in 'Title', with: @playlist.title
      fill_in 'Description', with: @playlist.description
      select @speaker.name, from: 'playlist_speaker_ids'
      click_on 'Create Playlist'

      assert_text 'Playlist was successfully created'
      click_on 'Back'
    end

    test 'should update playlist' do
      visit admin_playlist_url(@playlist)
      click_on 'Edit this playlist', match: :first

      fill_in 'Title', with: @playlist.title
      fill_in 'Description', with: @playlist.description
      select @speaker.name, from: 'playlist_speaker_ids'
      click_on 'Update Playlist'

      assert_text 'Playlist was successfully updated'
      click_on 'Back'
    end

    test 'should destroy playlist' do
      visit admin_playlist_url(@playlist)
      click_on 'Destroy this playlist', match: :first

      assert_text 'Playlist was successfully destroyed'
    end
  end
end
