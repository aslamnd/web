class BaseSubdomain
  class << self
    def matches?(request)
      request.subdomain == ''
    end
  end
end
