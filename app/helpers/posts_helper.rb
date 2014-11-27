module PostsHelper
  def post_position(path)
    "#{path}#title"
  end

  def available_posts?
    Post.published.any?
  end
end