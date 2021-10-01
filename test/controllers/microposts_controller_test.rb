require "test_helper"

class MicropostsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @micropost = microposts(:orange)
  end

  test '' do
    assert_no_difference 'Micropost.count' do
      post microposts_path, params: { microposts: { content: 'Lorem Ipsum' } }
    end
    assert_redirected_to login_url
  end
  test 'should be redirect destroy when not logged in' do
    assert_no_difference 'Micropost.count' do
      delete micropost_path(@micropost)
    end
    assert_redirected_to login_url
  end

  test 'should redirect destroy for wrong user' do
    log_in_as(users(:benito))
    assert_no_difference 'Micropost.count' do
      delete :destroy, id: microposts(:ants)
    end
  end
end
