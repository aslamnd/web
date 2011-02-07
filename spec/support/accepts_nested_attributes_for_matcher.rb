RSpec::Matchers.define :accept_nested_attributes_for do |expected|
  match do |actual|
    actual.respond_to? "#{expected}_attributes="
  end
end
