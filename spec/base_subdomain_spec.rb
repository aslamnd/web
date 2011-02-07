require 'spec_helper'

describe BaseSubdomain do
  let(:request) { double('request') }

  describe ".matches?" do
    context "when the subdomain is blank" do
      it 'returns true' do
        request.stub(:subdomain).and_return ''
        BaseSubdomain.matches?(request).should be_true
      end
    end
    context "when the subdomain is codegram" do
      it 'returns true' do
        request.stub(:subdomain).and_return 'codegram'
        BaseSubdomain.matches?(request).should be_true
      end
    end
    context "when the subdomain is www" do
      it 'returns true' do
        request.stub(:subdomain).and_return 'www'
        BaseSubdomain.matches?(request).should be_true
      end
    end
    context "otherwise" do
      it 'returns false' do
        request.stub(:subdomain).and_return 'blog'
        BaseSubdomain.matches?(request).should be_false
      end
    end
  end

end
