require 'spec_helper'

describe Post do

  describe "attributes" do
    it { should respond_to(:title, :body, :friendly_id) }
  end

  describe "relations" do
    it { should belong_to(:author) }
  end

  describe "delegations" do
    it { should delegate(:name).to(:author).with_prefix }
    it { should delegate(:month).to(:created_at) }
    it { should delegate(:year).to(:created_at) }
  end

end
