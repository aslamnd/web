module PostsHelper
  def post_link(post, options={})
    options[:host] ||= false
    link_to(post.title, post_url(post, options))
  end

  def comment_count(post, options={})
    options[:host] ||= false
    link_to("Comments", post_url(post, options) + "#disqus_thread")
  end

  def post_url(post, options={})
    options[:host] ||= false
    (options[:host] ? "http://blog.codegram.com" : '') + blog_post_path(post, year: post.year, month: post.month)
  end
end
