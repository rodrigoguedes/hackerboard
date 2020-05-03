require "rails_helper"

describe ApplicationHelper do
  describe "#avatar_tag" do
    it "generates image" do
      user = User.new(name: "USER", email: "EMAIL")

      html = Nokogiri::HTML(helper.avatar_tag(user))
      image = html.css("img").first
      url = "http://gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}?s=50&d=mm"

      expect(image["class"]).to eql("avatar")
      expect(image["alt"]).to eql(user.name)
      expect(image["src"]).to eql(url)
    end
  end
  
  describe "#markdown" do
    it "includes paragraph" do
      expect(helper.markdown("hello")).to include("<p>hello</p>")
    end
    
    it "includes strong" do
      expect(helper.markdown("**hello**")).to include("<strong>hello</strong>")
    end

    it "includes emphasis" do
      expect(helper.markdown("_hello_")).to include("<em>hello</em>")
    end

    it "includes code" do
      expect(helper.markdown("`hello`")).to include("<code>hello</code>")
    end

    it "includes blockquote" do
      expect(helper.markdown("> hello")).to include("<blockquote>\n<p>hello</p>\n</blockquote>")
    end

    it "includes performatted" do
      expect(helper.markdown("    code")).to include("<pre><code>code\n</code></pre>\n")
    end

    it "includes link" do
      expect(helper.markdown("[Site](http://example.org)")).to include(%[<a href=\"http://example.org\">Site</a>])
    end

    it "includes unordered list" do
      md = <<-MARKDOWN.strip_heredoc
      * Item 1
      * Item 2
      MARKDOWN

      html = helper.markdown(md)

      expect(html).to include "<ul>"
      expect(html).to include "<li>Item 1</li>"
      expect(html).to include("<li>Item 2</li>")
    end

    it "includes ordered list" do
      md = <<-MARKDOWN.strip_heredoc
      1. Item 1
      2. Item 2
      MARKDOWN

      html = helper.markdown(md)

      expect(html).to include "<ol>"
      expect(html).to include "<li>Item 1</li>"
      expect(html).to include("<li>Item 2</li>")
    end

    it "strips unlisted tags" do
      html = helper.markdown("<b>hello</b>")

      expect(html).not_to include("<b>hello</b>")
      expect(html).to include("<p>hello</p>")
    end

    it "strips unlisted attributes" do
      html = helper.markdown("<p class='test'>hello</p>")

      expect(html).to include("<p>hello</p>")
    end

  end
end