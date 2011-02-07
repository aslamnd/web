atom_feed do |feed|
  feed.title "Codegram Blog"

  feed.updated collection.first.created_at

  collection.each do |post|
    feed.entry(post, url: post_link(post, :host => true)) do |entry|

      entry.title post.title
      entry.summary post.tagline

      entry.body post.rendered_body.html_safe

      entry.author do |author|
        author.name(post.author_name)
      end
    end
  end
end
