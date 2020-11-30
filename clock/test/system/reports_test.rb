# frozen_string_literal: true

require 'application_system_test_case'

# Reports Helper
class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:one)
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: 'Reports'
  end

  test 'creating a Report' do
    visit reports_url
    click_on 'New Report'

    fill_in 'Date', with: @report.date
    fill_in 'Employee', with: @report.employee_id
    fill_in 'Hour finish', with: @report.hour_finish
    fill_in 'Hour start', with: @report.hour_start
    fill_in 'Work day', with: @report.work_day
    click_on 'Create Report'

    assert_text 'Report was successfully created'
    click_on 'Back'
  end

  test 'updating a Report' do
    visit reports_url
    click_on 'Edit', match: :first

    fill_in 'Date', with: @report.date
    fill_in 'Employee', with: @report.employee_id
    fill_in 'Hour finish', with: @report.hour_finish
    fill_in 'Hour start', with: @report.hour_start
    fill_in 'Work day', with: @report.work_day
    click_on 'Update Report'

    assert_text 'Report was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Report' do
    visit reports_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Report was successfully destroyed'
  end
end
