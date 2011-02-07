require 'rest-client'
require 'crack/json'

module RubygemsFetcher
  class << self
    def get data, rubygem
      Crack::JSON.parse(
        RestClient.get("http://rubygems.org/api/v1/gems/#{rubygem}.json").body
      )[data.to_s].to_i
    rescue RestClient::ResourceNotFound
      0
    end
  end
end
