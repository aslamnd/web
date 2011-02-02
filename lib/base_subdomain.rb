class BaseSubdomain
  class << self
    def matches?(request)
      request.subdomain.blank?
    end
  end
end
