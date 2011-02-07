class BlogCell < Cell::Rails

  # NOTE: I AREL'D
  def archive
   @grouped = Post.select('count(id) as count, strftime(\'%m\', created_at) as group_month, strftime(\'%Y\', created_at) as group_year').group("strftime('%m/%Y', created_at)").group_by{|group| group.group_year}
   render
  end

end
