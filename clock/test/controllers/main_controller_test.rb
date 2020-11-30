# frozen_string_literal: true

require 'test_helper'

# Main Controller Class
class MainControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get main_index_url
    assert_response :success
  end
end
