atom_feed do |feed|
  feed.title "Codegram Blog"

  feed.updated collection.first.created_at

  feed.icon "http://#{request.host_with_port}/favicon.ico"
  feed.logo "http://#{request.host_with_port}/images/logo.png"

  collection.each do |post|
    feed.entry(post, url: post_url(post, host: true)) do |entry|

      entry.title post.title
      entry.summary post.tagline

      if post.picture?
        entry.link rel: 'enclosure',
                   type: 'text/jpeg',
                   href: 'text/html',
                   href: "http://#{request.host_with_port}#{post.picture.thumb.url}"
      end

      entry.content post.rendered_body.html_safe, type: 'html'

      entry.author do |author|
        author.name(post.author_name)
      end

    end
  end
end
