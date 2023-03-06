require 'test_helper'

module Admin
  class CuesControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      sign_in users(:first_user)

      @cue = cues(:first_cue)
    end

    test 'should get index' do
      get admin_cues_url
      assert_response :success
    end

    test 'should get new' do
      get new_admin_cue_url
      assert_response :success
    end

    test 'should create cue' do
      assert_difference('Cue.count') do
        post admin_cues_url, params: {
          cue: {
            content: @cue.content,
            end_time: @cue.end_time,
            start_time: @cue.start_time,
            medium_id: @cue.medium_id
          }
        }
      end

      assert_redirected_to admin_cue_url(Cue.last)
    end

    test 'should show cue' do
      get admin_cue_url(@cue)
      assert_response :success
    end

    test 'should get edit' do
      get edit_admin_cue_url(@cue)
      assert_response :success
    end

    test 'should update cue' do
      patch admin_cue_url(@cue), params: {
        cue: {
          content: @cue.content,
          end_time: @cue.end_time,
          start_time: @cue.start_time,
          medium_id: @cue.medium_id
        }
      }

      assert_redirected_to admin_cue_url(@cue)
    end

    test 'should destroy cue' do
      assert_difference('Cue.count', -1) do
        delete admin_cue_url(@cue)
      end

      assert_redirected_to admin_cues_url
    end
  end
end
