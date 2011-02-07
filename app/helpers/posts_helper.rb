module PostsHelper
  def post_link(post, options={})
    options[:host] ||= false
    link_to(post.title, (options[:host] ? "http://blog.codegram.com" : '') + blog_post_path(post, year: post.year, month: post.month))
  end
end
