require 'spec_helper'

describe BaseSubdomain do
  let(:request) { double('request') }

  describe ".matches?" do
    context "when the subdomain is blank" do
      it 'returns true' do
        request.stub_chain('subdomain.blank?').and_return true
        subject.matches?(request).should be_true
      end
    end
    context "otherwise" do
      it 'returns false' do
        request.stub_chain('subdomain.blank?').and_return false
        subject.matches?(request).should be_false
      end
    end
  end

end
