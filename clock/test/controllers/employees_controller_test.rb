# frozen_string_literal: true

require 'test_helper'

# Employee Controller
class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee = employees(:one)
  end

  test 'should get index' do
    get employees_url
    assert_response :success
  end

  test 'should get new' do
    get new_employee_url
    assert_response :success
  end

  test 'should create employee' do
    assert_difference('Employee.count') do
      post employees_url, params: {
        employee: {
          address: @employee.address,
          departure_time: @employee.departure_time,
          enter_time: @employee.enter_time,
          name: @employee.name,
          nip: @employee.nip,
          status: @employee.status,
          work_days: @employee.work_days
        }
      }
    end
    assert_redirected_to employee_url(Employee.last)
  end

  test 'should show employee' do
    get employee_url(@employee)
    assert_response :success
  end

  test 'should get edit' do
    get edit_employee_url(@employee)
    assert_response :success
  end

  test 'should update employee' do
    patch employee_url(@employee), params: {
      employee: {
        address: @employee.address,
        departure_time: @employee.departure_time,
        enter_time: @employee.enter_time,
        name: @employee.name,
        nip: @employee.nip,
        status: @employee.status,
        work_days: @employee.work_days
      }
    }
    assert_redirected_to employee_url(@employee)
  end
end
