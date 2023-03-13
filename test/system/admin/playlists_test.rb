require 'application_system_test_case'

module Admin
  class PlaylistsTest < ApplicationSystemTestCase
    include Devise::Test::IntegrationHelpers

    setup do
      sign_in users(:first_user)

      @playlist = playlists(:first_playlist)
    end

    test 'visiting the index' do
      visit admin_playlists_url
      assert_selector 'span', text: I18n.t('admin.templates.index.playlists.title')
    end

    test 'should create playlist' do
      visit admin_playlists_url
      find(:css, 'i.bi.bi-plus-circle-fill').click

      fill_in I18n.t('attributes.title'), with: @playlist.title
      fill_in I18n.t('attributes.description'), with: @playlist.description
      select @playlist.speakers.first.name, from: 'playlist_speaker_ids'
      click_on I18n.t('helpers.submit.playlist.create')

      assert_text 'Playlist was successfully created'
      click_on I18n.t('admin.templates.admin_navbar.manage_playlists')
    end

    test 'should update playlist' do
      visit admin_playlist_url(@playlist)
      find(:css, 'i.bi.bi-pencil-fill').click

      fill_in I18n.t('attributes.title'), with: @playlist.title
      fill_in I18n.t('attributes.description'), with: @playlist.description
      select @playlist.speakers.first.name, from: 'playlist_speaker_ids'
      click_on I18n.t('helpers.submit.playlist.update')

      assert_text 'Playlist was successfully updated'
      click_on I18n.t('admin.templates.admin_navbar.manage_playlists')
    end

    test 'should destroy playlist' do
      visit admin_playlist_url(@playlist)
      accept_confirm do
        find(:css, 'i.bi.bi-trash-fill').click
      end

      assert_text 'Playlist was successfully destroyed'
    end
  end
end
