require 'application_system_test_case'

module Admin
  class CuesTest < ApplicationSystemTestCase
    include Devise::Test::IntegrationHelpers

    setup do
      sign_in users(:first_user)

      @cue = cues(:first_cue)
    end

    test 'visiting the index' do
      visit admin_cues_url
      assert_selector 'h1', text: 'Cues'
    end

    test 'should create cue' do
      visit admin_cues_url
      click_on 'New cue'

      fill_in 'Content', with: @cue.content
      fill_in 'End time', with: @cue.end_time
      fill_in 'Start time', with: @cue.start_time
      select @cue.medium.title, from: 'cue_medium_id'
      click_on 'Create Cue'

      assert_text 'Cue was successfully created'
      click_on 'Back'
    end

    test 'should update cue' do
      visit admin_cue_url(@cue)
      click_on 'Edit this cue', match: :first

      fill_in 'Content', with: @cue.content
      fill_in 'End time', with: @cue.end_time
      fill_in 'Start time', with: @cue.start_time
      select @cue.medium.title, from: 'cue_medium_id'
      click_on 'Update Cue'

      assert_text 'Cue was successfully updated'
      click_on 'Back'
    end

    test 'should destroy cue' do
      visit admin_cue_url(@cue)
      click_on 'Destroy this cue', match: :first

      assert_text 'Cue was successfully destroyed'
    end
  end
end
