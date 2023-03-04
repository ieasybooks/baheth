require 'test_helper'

module Admin
  class PlaylistsControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      sign_in users(:first_user)

      @playlist = playlists(:first_playlist)
      @speaker_one = speakers(:first_speaker)
      @speaker_two = speakers(:second_speaker)
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
        post admin_playlists_url, params: {
          playlist: {
            title: @playlist.title,
            description: @playlist.description,
            speaker_ids: [@speaker_one.id]
          }
        }
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
      patch admin_playlist_url(@playlist), params: {
        playlist: {
          title: @playlist.title,
          description: @playlist.description,
          speaker_ids: [@speaker_two.id]
        }
      }

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
