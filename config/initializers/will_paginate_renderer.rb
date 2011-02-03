class PaginationNoFollow < WillPaginate::ViewHelpers::LinkRenderer
  def rel_value(page)
    "nofollow"
  end
end
