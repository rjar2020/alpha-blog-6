require "test_helper"

class UserSignUpTest < ActionDispatch::IntegrationTest
  test "get sign-up form and create user" do
    get "/signup"
    assert_response :success
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { username: "jonny", email: "john@example.com",
                                password: "password" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "jonny", response.body
    assert_match "john@example.com", response.body
  end
end
