require 'spec_helper'

describe Post do

  describe "attributes" do
    it { should respond_to(:title, :tagline, :body, :friendly_id, :published) }
  end

  describe "relations" do
    it { should belong_to(:author) }
  end

  describe "delegations" do
    it { should delegate(:name).to(:author).with_prefix }
    it { should delegate(:month).to(:created_at) }
    it { should delegate(:year).to(:created_at) }
  end

  describe "validations" do
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
  end

  describe "scopes" do
    describe "default scope" do
      it "returns only published posts" do
        published_post = Factory :post, published: true
        
        Post.all.should == [published_post]
      end

      it "does not return unpublished posts" do
        unpublished_post = Factory :post, published: false

        Post.all.should_not include unpublished_post
      end
    end

    describe ".from_archive" do

      let(:february_post) do
        Factory.create :post, created_at: Date.new(2010,2,10)
      end
      let(:future_post) do
        Factory.create :post, created_at: Date.new(2011,2,10)
      end

      before do
        Factory.create :post, created_at: Date.new(2010,3,10)
      end

      context "provided only a year" do
        let(:args) { ['2011']}
        it 'returns posts of that year' do
          expected = future_post
          Post.from_archive(*args).all.should == [expected]
        end
      end
      context "provided a year and a month" do
        let(:args) { ['2010', '02']}
        it 'returns posts of that month' do
          expected = february_post
          Post.from_archive(*args).all.should == [expected]
        end
      end
    end
  end

end
