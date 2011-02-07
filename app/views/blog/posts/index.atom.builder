atom_feed do |feed|
  feed.title "Codegram Blog"

  feed.updated collection.first.created_at

  collection.each do |post|
    feed.entry(post, url: post_link(post, :host => true)) do |entry|

      entry.title post.title
      entry.summary post.tagline

      if post.picture
        entry.link(:rel => 'enclosure', :type => 'image/jpeg', :href => "#{request.host_with_port}/#{post.picture_url}")
      end

      entry.body post.rendered_body.html_safe

      entry.author do |author|
        author.name(post.author_name)
      end


    end
  end
end
