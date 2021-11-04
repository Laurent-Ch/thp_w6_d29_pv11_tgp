require 'test_helper'

class LikeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get like_index_url
    assert_response :success
  end

  test 'should get show' do
    get like_show_url
    assert_response :success
  end

  test 'should get update' do
    get like_update_url
    assert_response :success
  end

  test 'should get destroy' do
    get like_destroy_url
    assert_response :success
  end

  test 'should get new' do
    get like_new_url
    assert_response :success
  end

  test 'should get edit' do
    get like_edit_url
    assert_response :success
  end
end
