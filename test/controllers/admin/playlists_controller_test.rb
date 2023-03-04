require 'test_helper'

module Admin
  class PlaylistsControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      sign_in users(:one)
      @playlist = playlists(:one)
    end

    test 'should get index' do
      get admin_playlists_url
      assert_response :success
    end

    test 'should get new' do
      get new_admin_playlist_url
      assert_response :success
    end

    test 'should create playlist' do
      assert_difference('Playlist.count') do
        post admin_playlists_url, params: { playlist: { description: @playlist.description, title: @playlist.title } }
      end

      assert_redirected_to admin_playlist_url(Playlist.last)
    end

    test 'should show playlist' do
      get admin_playlist_url(@playlist)
      assert_response :success
    end

    test 'should get edit' do
      get edit_admin_playlist_url(@playlist)
      assert_response :success
    end

    test 'should update playlist' do
      patch admin_playlist_url(@playlist),
            params: { playlist: { description: @playlist.description, title: @playlist.title } }
      assert_redirected_to admin_playlist_url(@playlist)
    end

    test 'should destroy playlist' do
      assert_difference('Playlist.count', -1) do
        delete admin_playlist_url(@playlist)
      end

      assert_redirected_to admin_playlists_url
    end
  end
end
