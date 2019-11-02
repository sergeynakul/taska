require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test 'should get period_accuracy_form' do
    get search_period_accuracy_form_url
    assert_response :success
  end

  test 'should get weekly_rankings_form' do
    get search_weekly_rankings_form_url
    assert_response :success
  end

  test 'should get period_accuracy_output' do
    get search_period_accuracy_output_url
    assert_response :success
  end

  test 'should get weekly_rankings_output' do
    get search_weekly_rankings_output_url
    assert_response :success
  end
end
