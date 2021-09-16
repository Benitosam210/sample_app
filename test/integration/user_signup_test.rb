require "test_helper"

class UserSignupTest < ActionDispatch::IntegrationTest
  test "invalid sign up"do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:                  "",
                                         email:                 "invalid@mail",
                                         password:              "Foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'

    test "valid sign up information" do
      get signup_path
      assert_difference 'User.count', 1 do
        post users_path, params: { user: { name:                  "Benito Sam",
                                           email:                 "example@railstutorial.org",
                                           password:              "password",
                                           password_confirmation: "password" } }
      end
      follow redirect!
      assert_template 'users/show'
    end
  end
end
