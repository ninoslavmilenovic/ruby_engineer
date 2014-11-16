module ApplicationHelper
  def markdown(text)
    MARKDOWN.render(text).html_safe
  end

  def available_posts?
    Post.published.any?
  end

  def format_date(date)
    date.strftime("%d %b %Y")
  end
end
