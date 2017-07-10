require 'test_helper'

class ShortenedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shortened = shorteneds(:one)
  end

  test "should get index" do
    get shorteneds_url
    assert_response :success
  end

  test "should get new" do
    get new_shortened_url
    assert_response :success
  end

  test "should create shortened" do
    assert_difference('Shortened.count') do
      post shorteneds_url, params: { shortened: { http_status: @shortened.http_status, in_url: @shortened.in_url } }
    end

    assert_redirected_to shortened_url(Shortened.last)
  end

  test "should show shortened" do
    get shortened_url(@shortened)
    assert_response :success
  end

  test "should get edit" do
    get edit_shortened_url(@shortened)
    assert_response :success
  end

  test "should update shortened" do
    patch shortened_url(@shortened), params: { shortened: { http_status: @shortened.http_status, in_url: @shortened.in_url } }
    assert_redirected_to shortened_url(@shortened)
  end

  test "should destroy shortened" do
    assert_difference('Shortened.count', -1) do
      delete shortened_url(@shortened)
    end

    assert_redirected_to shorteneds_url
  end
end
