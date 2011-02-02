module PostsHelper

  # TODO: Highlight author name and date with slim
  def date_and_author_for(post)
    out = 'posted by '
    out << post.author_name
    out << ' on '
    out << post.created_at.to_s(:date)
  end

end
