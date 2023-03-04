require 'application_system_test_case'

module Admin
  class SpeakersTest < ApplicationSystemTestCase
    include Devise::Test::IntegrationHelpers

    setup do
      sign_in users(:one)
      @speaker = speakers(:one)
    end

    test 'visiting the index' do
      visit admin_speakers_url
      assert_selector 'h1', text: 'Speakers'
    end

    test 'should create speaker' do
      visit admin_speakers_url
      click_on 'New speaker'

      fill_in 'Description', with: @speaker.description
      fill_in 'Name', with: @speaker.name
      within '#speaker_user_id' do
        find("option[value='#{@speaker.user_id}']").click
      end
      click_on 'Create Speaker'

      assert_text 'Speaker was successfully created'
      click_on 'Back'
    end

    test 'should update speaker' do
      visit admin_speaker_url(@speaker)
      click_on 'Edit this speaker', match: :first

      fill_in 'Description', with: @speaker.description
      fill_in 'Name', with: @speaker.name
      within '#speaker_user_id' do
        find("option[value='#{@speaker.user_id}']").click
      end
      click_on 'Update Speaker'

      assert_text 'Speaker was successfully updated'
      click_on 'Back'
    end

    test 'should destroy speaker' do
      visit admin_speaker_url(@speaker)
      click_on 'Destroy this speaker', match: :first

      assert_text 'Speaker was successfully destroyed'
    end
  end
end
