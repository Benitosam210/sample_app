require 'test_helper'

class MicropostTest < ActiveSupport::TestCase

  def setup
    @user = users(:benito)
    @micropost = @user.microposts.build(content: 'Lorem ipsum')
  end

  test 'should be valid' do
    assert @micropost.valid?
  end

  test 'user id should be present' do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test 'content should be present' do
    @micropost.content = '  '
    assert_not @micropost.valid?
  end

  test 'content should be 120 characters' do
    @micropost.content = ' a ' * 121
    assert_not @micropost.valid?
  end

  test 'order should be most resent first' do
    assert_equal Micropost.first, microposts(:most_recent)
  end
end
