require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user       = users(:benito)
    @other_user = users(:beryl)
  end

  test 'should get new' do
    get root_path
    assert_response :success
  end

  test 'should redirect to index when not logged in' do
    get users_path
    assert_redirected_to login_url
  end


  test 'should redirect edit when not logged in' do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should redirect update when not logged in' do
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should redirect edit when wrong user logged in' do
    log_in_as(@other_user)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test 'should redirect update when wrong user logged in' do
    log_in_as(@other_user)
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }
    assert flash.empty?
    assert_redirected_to root_url
  end

  test 'should be redirect destroy when not logged in' do
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to login_url
  end

  test 'should be redirect destroy when logged in as a non-admin' do
    log_in_as(@other_user)
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to root_url
  end

  test 'should redirect following when not logged in' do
    get :following, id: @user
    assert_redirected_to login_url
  end

  test 'should redirect followers when not logged in' do
    get :followers, id: @user
    assert_redirected_to login_url

  end
end
