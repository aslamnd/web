require 'spec_helper'
require 'json'

module Api
  describe PostsController do

    describe "#create" do

      it 'creates a post' do
        user = Factory(:user)
        User.stub(:find_by_api_token).and_return user

        post :create, token: '123456', post: { title: 'My title', body: "#My body"}

        blogpost = Post.unscoped.last

        blogpost.title.should == 'My title'
        blogpost.body.should == '#My body'
        blogpost.author.should == user
        blogpost.published.should be_false

        response.code.should == "201"
      end

      context 'when the post is invalid' do
        it 'returns the errors' do
          user = Factory(:user)
          User.stub(:find_by_api_token).and_return user

          post :create, token: '123456', post: { title: 'Title with no body'}
          response.code.should == "400"
          JSON.parse(response.header['Errors']).should == {"body" => ["can't be blank"]}
        end
      end

      context 'when the token is invalid' do
        it 'rejects the request' do
          User.stub(:find_by_api_token).and_return nil

          post :create, token: '1234567'

          response.code.should == "401"
        end
      end

    end

  end
end
