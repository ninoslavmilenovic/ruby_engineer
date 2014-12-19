module ApplicationHelper
  def full_title(page_title="")
    base_title = "Nino | Ruby on Rails Engineer"
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def markdown(text)
    MARKDOWN.render(text).html_safe
  end

  def format_date(date)
    date.strftime("%d %b %Y")
  end
end
