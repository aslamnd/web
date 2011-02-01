Factory.define :post do |p|
  p.title 'Fun with Rails engines'
  p.body """
    New Rails engines are fun to work with!
  """
  p.association :author
end
