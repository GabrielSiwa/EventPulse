require "test_helper"

class PostsFeedTest < ActionDispatch::IntegrationTest
  setup do
    @post1 = Post.create!(
      title: "Test Post 1",
      body: "This is the first test post",
      published_at: 1.day.ago
    )
    @post2 = Post.create!(
      title: "Test Post 2",
      body: "This is the second test post",
      published_at: 2.days.ago
    )
  end

  test "GET /feed.rss returns 200 status" do
    get "/feed.rss"
    assert_response :success
  end

  test "GET /feed.rss returns RSS content type" do
    get "/feed.rss"
    assert_equal "application/rss+xml; charset=utf-8", @response.content_type
  end

  test "GET /feed.rss contains post title in RSS" do
    get "/feed.rss"
    assert_response :success
    assert_match @post1.title, @response.body
  end
end
