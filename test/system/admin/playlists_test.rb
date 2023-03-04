require 'application_system_test_case'

module Admin
  class PlaylistsTest < ApplicationSystemTestCase
    include Devise::Test::IntegrationHelpers

    setup do
      sign_in users(:one)
      @playlist = playlists(:one)
    end

    test 'visiting the index' do
      visit admin_playlists_url
      assert_selector 'h1', text: 'Playlists'
    end

    test 'should create playlist' do
      visit admin_playlists_url
      click_on 'New playlist'

      fill_in 'Description', with: @playlist.description
      fill_in 'Title', with: @playlist.title
      click_on 'Create Playlist'

      assert_text 'Playlist was successfully created'
      click_on 'Back'
    end

    test 'should update Playlist' do
      visit admin_playlist_url(@playlist)
      click_on 'Edit this playlist', match: :first

      fill_in 'Description', with: @playlist.description
      fill_in 'Title', with: @playlist.title
      click_on 'Update Playlist'

      assert_text 'Playlist was successfully updated'
      click_on 'Back'
    end

    test 'should destroy Playlist' do
      visit admin_playlist_url(@playlist)
      click_on 'Destroy this playlist', match: :first

      assert_text 'Playlist was successfully destroyed'
    end
  end
end
