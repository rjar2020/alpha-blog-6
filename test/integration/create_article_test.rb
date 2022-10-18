require "test_helper"

class CreateArticleTest < ActionDispatch::IntegrationTest

  setup do
    @loged_user = User.create(username: "johndoe", email: "johndoe@example.com",
                        password: "password", admin: false)
    sign_in_as(@loged_user)
  end

  test "get new article form and create article" do
    get "/articles/new"
    assert_response :success
    assert_difference 'Article.count', 1 do
      post articles_path, params: { article: { title: "Da Integration Article", description: "this will integrate you" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Da Integration Article", response.body
    assert_match "this will integrate you", response.body
  end
end
