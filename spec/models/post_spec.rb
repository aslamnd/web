require 'spec_helper'

describe Post do
  it { should respond_to(:title, :body) }
  it { should belong_to(:author) }
end
