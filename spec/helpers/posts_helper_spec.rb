require 'spec_helper'

describe PostsHelper do
  let(:post) do
    post = Post.new created_at: Date.new(2010,11,2).to_time.utc
    post.stub(:author_name).and_return 'Josep Jaume Rey'
    post
  end

  describe "#date_and_author_for(post)" do
    it 'shows the date and the author of the post' do
      date_and_author_for(post).should == "posted by Josep Jaume Rey on November 1st, 2010"
    end
  end

end
