atom_feed do |feed|
  feed.title "Hackerboard: #{@question.title}"
  feed.updated @question.replied_at || @question.created_at
  feed.author do |author|
    author.name @question.user.name
  end

  @replies.each do |reply|
    url = question_url(@question, anchor: dom_id(reply))
    feed.entry(reply, url: url) do |entry|
      entry.title t("question.feed.replied_by", name: reply.user.name)
      entry.content markdown(reply.content), type: "html"
      entry.author do |author|
        author.name reply.user.name
      end
    end
  end
end