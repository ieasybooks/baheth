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
      assert_selector 'span', text: I18n.t('admin.templates.index.cues.title')
    end

    test 'should create cue' do
      visit admin_cues_url
      find(:css, 'i.bi.bi-plus-circle-fill').click

      fill_in I18n.t('attributes.content'), with: @cue.content
      fill_in I18n.t('attributes.start_time'), with: @cue.start_time
      fill_in I18n.t('attributes.end_time'), with: @cue.end_time
      select @cue.medium.title, from: 'cue_medium_id'
      click_on I18n.t('helpers.submit.cue.create')

      assert_text 'Cue was successfully created'
      click_on I18n.t('admin.templates.admin_navbar.manage_cues')
    end

    test 'should update cue' do
      visit admin_cue_url(@cue)
      find(:css, 'i.bi.bi-pencil-fill').click

      fill_in I18n.t('attributes.content'), with: @cue.content
      fill_in I18n.t('attributes.start_time'), with: @cue.start_time
      fill_in I18n.t('attributes.end_time'), with: @cue.end_time
      select @cue.medium.title, from: 'cue_medium_id'
      click_on I18n.t('helpers.submit.cue.update')

      assert_text 'Cue was successfully updated'
      click_on I18n.t('admin.templates.admin_navbar.manage_speakers')
    end

    test 'should destroy cue' do
      visit admin_cue_url(@cue)
      accept_confirm do
        find(:css, 'i.bi.bi-trash-fill').click
      end

      assert_text 'Cue was successfully destroyed'
    end
  end
end
