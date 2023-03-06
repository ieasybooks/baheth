require 'application_system_test_case'

module Admin
  class MediaTest < ApplicationSystemTestCase
    include Devise::Test::IntegrationHelpers

    setup do
      sign_in users(:first_user)

      @medium = media(:first_medium)
    end

    test 'visiting the index' do
      visit admin_media_url
      assert_selector 'h1', text: 'Media'
    end

    test 'should create medium' do
      visit admin_media_url
      click_on 'New medium'

      fill_in 'Title', with: @medium.title
      fill_in 'Description', with: @medium.description
      fill_in 'Duration', with: @medium.duration
      fill_in 'Link', with: @medium.link
      attach_file('medium[transcript]', Rails.root.join('test/fixtures/files/transcript.txt'))
      select @medium.playlist.title, from: 'medium_playlist_id'
      click_on 'Create Medium'

      assert_text 'Medium was successfully created'
      click_on 'Back'
    end

    test 'should update medium' do
      visit admin_medium_url(@medium)
      click_on 'Edit this medium', match: :first

      # Delete the attached transcript to make sure that the update action fails if the transcript is not provided.
      @medium.transcript.purge

      fill_in 'Title', with: @medium.title
      fill_in 'Description', with: @medium.description
      fill_in 'Duration', with: @medium.duration
      fill_in 'Link', with: @medium.link
      attach_file('medium[transcript]', Rails.root.join('test/fixtures/files/transcript.txt'))
      select @medium.playlist.title, from: 'medium_playlist_id'
      click_on 'Update Medium'

      assert_text 'Medium was successfully updated'
      click_on 'Back'
    end

    test 'should destroy medium' do
      visit admin_medium_url(@medium)
      click_on 'Destroy this medium', match: :first

      assert_text 'Medium was successfully destroyed'
    end
  end
end
