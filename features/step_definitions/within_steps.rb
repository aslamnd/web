{
  # Users
  'in the users list' => '#users',
  'in the first user' => '#users .user:nth-of-type(1)',

  # Posts
  'in the posts list' => '#posts',
  'in the first post' => '#posts .post:nth-of-type(1)',

  # Projects
  'in the projects list' => '#projects',
  'in the first project' => '#projects .project:nth-of-type(1)',

  # Screenshots
  'for the first screenshot' => '#screenshots .screenshot:nth-of-type(1)',
}.
each do |within, selector|
  Then /^(.+) #{within}$/ do |step|
    with_scope(selector) do
      Then step
    end
  end
end
