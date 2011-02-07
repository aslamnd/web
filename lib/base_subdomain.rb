class BaseSubdomain
  class << self
    def matches?(request)
      ['codegram', '', 'www'].include? request.subdomain
    end
  end
end
