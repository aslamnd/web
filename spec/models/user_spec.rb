require 'spec_helper'

describe User do
  it { should respond_to(:email, :password, :password_confirmation, :description) }
  it { should have_many(:posts) }
  it { should have_many(:user_tokens) }

  describe "class methods" do
    describe "#find_for_twitter_oauth" do
      let(:omniauth) { { 'uid' => '12345',
          'provider' => 'twitter',
          "user_info"=> {"name"=>"Codegram", "email"=>"info@codegram.com", "nickname"=>"codegram"} }
      }
      let(:authentication) { mock_model(UserToken, user: mock_model(User, id: 1) )}

      context "when a user token exists" do
        it 'returns a persisted user' do
          UserToken.should_receive(:find_by_provider_and_uid).and_return(authentication)
          User.find_for_twitter_oauth(omniauth).should be_persisted
        end
      end
      context "otherwise" do
        it 'returns a blank user' do
          UserToken.should_receive(:find_by_provider_and_uid).and_return(nil)
          User.find_for_twitter_oauth(omniauth).should_not be_persisted
        end
      end
    end
  end

  describe "#assign_api_token" do
    it 'assigns a generated API token to the user' do
      subject.stub(:twitter).and_return 'mytwittername'
      ENV.stub(:[]).with('TWITTER_SECRET').and_return "8724yth9b"

      subject.assign_api_token

      subject.api_token.should == Digest::SHA1.hexdigest("8724yth9bmytwittername")
    end
  end

end
