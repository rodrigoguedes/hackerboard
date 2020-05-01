module ApplicationHelper
  def markdown(text)
    html = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new).render(text).html_safe
    sanitize html,
      tags: %w[ a strong em ul ol li blockquote pre code ],
      attributes: %w[ href ]
  end
end
