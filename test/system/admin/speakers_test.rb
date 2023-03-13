require 'application_system_test_case'

module Admin
  class SpeakersTest < ApplicationSystemTestCase
    include Devise::Test::IntegrationHelpers

    setup do
      sign_in users(:first_user)

      @speaker = speakers(:first_speaker)
    end

    test 'visiting the index' do
      visit admin_speakers_url
      assert_selector 'span', text: I18n.t('admin.templates.index.speakers.title')
    end

    test 'should create speaker' do
      visit admin_speakers_url
      find(:css, 'i.bi.bi-plus-circle-fill').click

      fill_in I18n.t('attributes.description'), with: @speaker.description
      fill_in I18n.t('attributes.name'), with: @speaker.name
      click_on I18n.t('helpers.submit.speaker.create')

      assert_text 'Speaker was successfully created'
      click_on I18n.t('admin.templates.admin_navbar.manage_speakers')
    end

    test 'should update speaker' do
      visit admin_speaker_url(@speaker)
      find(:css, 'i.bi.bi-pencil-fill').click

      fill_in I18n.t('attributes.description'), with: @speaker.description
      fill_in I18n.t('attributes.name'), with: @speaker.name
      click_on I18n.t('helpers.submit.speaker.update')

      assert_text 'Speaker was successfully updated'
      click_on I18n.t('admin.templates.admin_navbar.manage_speakers')
    end

    test 'should destroy speaker' do
      visit admin_speaker_url(@speaker)
      accept_confirm do
        find(:css, 'i.bi.bi-trash-fill').click
      end

      assert_text 'Speaker was successfully destroyed'
    end
  end
end
