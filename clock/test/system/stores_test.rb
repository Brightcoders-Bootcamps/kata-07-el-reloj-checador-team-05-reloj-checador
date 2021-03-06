# frozen_string_literal: true

require 'application_system_test_case'

# Store Test Helper
class StoresTest < ApplicationSystemTestCase
  setup do
    @store = stores(:one)
  end

  test 'visiting the index' do
    visit stores_url
    assert_selector 'h1', text: 'Stores'
  end

  test 'creating a Store' do
    visit stores_url
    click_on 'New Store'

    fill_in 'Address', with: @store.address
    fill_in 'Close time', with: @store.close_time
    fill_in 'Name', with: @store.name
    fill_in 'Open time', with: @store.open_time
    fill_in 'Phone', with: @store.phone
    fill_in 'Status', with: @store.status
    click_on 'Create Store'

    assert_text 'Store was successfully created'
    click_on 'Back'
  end

  test 'updating a Store' do
    visit stores_url
    click_on 'Edit', match: :first

    fill_in 'Address', with: @store.address
    fill_in 'Close time', with: @store.close_time
    fill_in 'Name', with: @store.name
    fill_in 'Open time', with: @store.open_time
    fill_in 'Phone', with: @store.phone
    fill_in 'Status', with: @store.status
    click_on 'Update Store'

    assert_text 'Store was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Store' do
    visit stores_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Store was successfully destroyed'
  end
end
