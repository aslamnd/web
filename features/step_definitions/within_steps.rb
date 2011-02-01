{
  'in the users list' => '#users',
  'in the posts list' => '#posts',
}.
each do |within, selector|
  Then /^(.+) #{within}$/ do |step|
    with_scope(selector) do
      Then step
    end
  end
end
