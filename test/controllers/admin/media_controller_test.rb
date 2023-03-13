require 'test_helper'

module Admin
  class MediaControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      sign_in users(:first_user)

      @medium = media(:first_medium)
    end

    test 'should get index' do
      get admin_media_url
      assert_response :success
    end

    test 'should get new' do
      get new_admin_medium_url
      assert_response :success
    end

    test 'should create medium' do
      assert_difference('Medium.count') do
        post admin_media_url, params: {
          medium: {
            title: @medium.title,
            description: @medium.description,
            duration: @medium.duration,
            link: @medium.link,
            source: @medium.source,
            producer: @medium.producer,
            provider: @medium.provider,
            transcript_txt: fixture_file_upload('transcript.txt', 'text/plain'),
            transcript_srt: fixture_file_upload('transcript.srt', 'text/srt'),
            playlist_id: @medium.playlist_id
          }
        }
      end

      assert_redirected_to admin_medium_url(Medium.last)
    end

    test 'should show medium' do
      get admin_medium_url(@medium)
      assert_response :success
    end

    test 'should get edit' do
      get edit_admin_medium_url(@medium)
      assert_response :success
    end

    test 'should update medium' do
      patch admin_medium_url(@medium), params: {
        medium: {
          title: @medium.title,
          description: @medium.description,
          duration: @medium.duration,
          link: @medium.link,
          source: @medium.source,
          producer: @medium.producer,
          provider: @medium.provider,
          transcript_txt: fixture_file_upload('transcript.txt', 'text/plain'),
          transcript_srt: fixture_file_upload('transcript.srt', 'text/srt'),
          playlist_id: @medium.playlist_id
        }
      }

      assert_redirected_to admin_medium_url(@medium)
    end

    test 'should destroy medium' do
      assert_difference('Medium.count', -1) do
        delete admin_medium_url(@medium)
      end

      assert_redirected_to admin_media_url
    end
  end
end
