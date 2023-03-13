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
      assert_selector 'span', text: I18n.t('admin.templates.index.media.title')
    end

    test 'should create medium' do
      visit admin_media_url
      find(:css, 'i.bi.bi-plus-circle-fill').click

      fill_in I18n.t('attributes.title'), with: @medium.title
      fill_in I18n.t('attributes.description'), with: @medium.description
      fill_in I18n.t('attributes.duration'), with: @medium.duration
      fill_in I18n.t('attributes.link'), with: @medium.link
      select I18n.t(".sources.#{@medium.source}"), from: 'medium_source'
      select I18n.t(".producers.#{@medium.producer}"), from: 'medium_producer'
      fill_in I18n.t('attributes.provider'), with: @medium.provider
      attach_file('medium[transcript_txt]', Rails.root.join('test/fixtures/files/transcript.txt'))
      attach_file('medium[transcript_srt]', Rails.root.join('test/fixtures/files/transcript.srt'))
      select @medium.playlist.title, from: 'medium_playlist_id'
      click_on I18n.t('helpers.submit.medium.create')

      assert_text 'Medium was successfully created'
      click_on I18n.t('admin.templates.admin_navbar.manage_media')
    end

    test 'should update medium' do
      visit admin_medium_url(@medium)
      find(:css, 'i.bi.bi-pencil-fill').click

      # Delete the attached transcript to make sure that the update action fails if the transcript is not provided.
      @medium.transcript_txt.purge

      fill_in I18n.t('attributes.title'), with: @medium.title
      fill_in I18n.t('attributes.description'), with: @medium.description
      fill_in I18n.t('attributes.duration'), with: @medium.duration
      fill_in I18n.t('attributes.link'), with: @medium.link
      select I18n.t(".sources.#{@medium.source}"), from: 'medium_source'
      select I18n.t(".producers.#{@medium.producer}"), from: 'medium_producer'
      fill_in I18n.t('attributes.provider'), with: @medium.provider
      attach_file('medium[transcript_txt]', Rails.root.join('test/fixtures/files/transcript.txt'))
      attach_file('medium[transcript_srt]', Rails.root.join('test/fixtures/files/transcript.srt'))
      select @medium.playlist.title, from: 'medium_playlist_id'
      click_on I18n.t('helpers.submit.medium.update')

      assert_text 'Medium was successfully updated'
      click_on I18n.t('admin.templates.admin_navbar.manage_media')
    end

    test 'should destroy medium' do
      visit admin_medium_url(@medium)
      accept_confirm do
        find(:css, 'i.bi.bi-trash-fill').click
      end

      assert_text 'Medium was successfully destroyed'
    end
  end
end
