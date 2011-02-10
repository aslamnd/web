class BaseSubdomain
  class << self
    def matches?(request)
      [''].include? request.subdomain
    end
  end
end
