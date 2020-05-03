module ApplicationHelper
  def markdown(text)
    html = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new).render(text).html_safe
    sanitize html,
      tags: %w[ a strong em ul ol li blockquote pre code p ],
      attributes: %w[ href ]
  end

  def avatar_tag(user)
    md5_hash = Digest::MD5.hexdigest(user.email)
    url = "http://gravatar.com/avatar/#{md5_hash}?s=50&d=mm"
    image_tag url, alt: user.name, class: "avatar"
  end
end
