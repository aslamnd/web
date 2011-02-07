require 'spec_helper'

describe RubygemsFetcher do
  describe '.get(data, rubygem)', 'data == :downloads' do
    it 'fetches downloads for a given rubygem' do
      RubygemsFetcher.get(:downloads, :date_validator).should > 3000
    end
    context 'when given an invalid gem' do
      it 'fetches 0 downloads' do
        RubygemsFetcher.get(:downloads, 'oh-my-god-what-is-going-on').should == 0
      end
    end
  end
end
